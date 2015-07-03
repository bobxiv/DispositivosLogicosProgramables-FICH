; -----------------------------------------------------------------------
; Plantilla generada por Piklab
    #include <p16f84a.inc>

; -----------------------------------------------------------------------
; Bits de configuración: adapte los parámetros a su necesidad
    __CONFIG _RC_OSC & _WDT_ON & _PWRTE_OFF & _CP_OFF

; -----------------------------------------------------------------------
; Declaración de variables
INT_VAR UDATA 0x0C
w_saved      RES 1 ; variable utilizada para guardar contexto
status_saved RES 1 ; variable utilizada para guardar contexto


ESTATUS	EQU	0x03
TRISA	EQU	0x85
TRISB	EQU	0x86
PORTA	EQU	0x05
PORTB	EQU	0x06
CICLO	EQU	0x0C
CONTATORE_1	EQU	0x0D
CONTATORE_2	EQU	0x0E

; -----------------------------------------------------------------------
; reiniciar vector
STARTUP CODE 0x000
    nop                    ; requerido para el depurado ICD2
    movlw   high start     ; cargar el byte superior de la etiqueta «start»
    movwf   PCLATH         ; inicializar PCLATH
    goto    start          ; ir al inicio del código principal

; vector de interrupciones
INT_VECTOR CODE 0x004
    goto    interrupt      ; ir al inicio del código de interrupción

; código reubicable
PROG CODE
interrupt
    movwf   w_saved        ; guardar contexto
    swapf   STATUS,w
    movwf   status_saved
    ; << agregue el código de interrupción >>
    swapf   status_saved,w ; restaurar contexto
    movwf   STATUS
    swapf   w_saved,f
    swapf   w_saved,w
    retfie

start

	bsf STATUS,5
	movlw	b'00011111'
	movwf	TRISA
	movlw	b'00000000'
	movwf	TRISB
	bcf	STATUS,5
	bsf	STATUS,0	
	clrf	PORTB	
	clrf	PORTA
	MOVLW	d'254' 	;Se define el ciclo de
	MOVWF	CICLO 	;trabajo (para un 50 %).
	goto	INIZIO
next0

	btfss	PORTA,0
	goto	next1
	goto	next2
next1

	btfss	PORTA,1
	goto	derecho
	goto	izquierda
	
next2

	btfss	PORTA,1
	goto	derecha
	goto	parado

derecho
	movlw	b'00001011'
	movwf	PORTB
	goto	next0
izquierda
	MOVLW	d'127' 	;Se define el ciclo de
	MOVWF	CICLO 	;trabajo (para un 50 %).
	movlw	b'00001010'
	movwf	PORTB
	return
derecha
	MOVLW	d'127' 	;Se define el ciclo de
	MOVWF	CICLO 	;trabajo (para un 50 %).
	movlw	b'00001111'
	movwf	PORTB
	return
parado
	movlw	b'00000000'
	movwf	PORTB
	goto	next0

;--------------------------------------------------------
;---------------------------------------------------------
;PROGRAMA PWM
;--------------------------------------------------------
;---------------------------------------------------------
INIZIO	
	call	next0
	MOVF	CICLO,0		;Transferencia del contenido de
	MOVWF	CONTATORE_1	;CICLO en CONTATORE_1 (CONTATORE_1
				;contiene 127).
T_ON
	BSF	PORTB,1		;Se pone a 1 la salida RB0 (encendido
	BSF	PORTB,3		;del diodo LED).
	CALL	DELAY_15s	;Se llama la temporizazi n y se
	DECFSZ	CONTATORE_1,1	;repite per el nœmero de veces
	GOTO	T_ON		;especificado en CONTATORE_1 (aqu :127).
	MOVLW	d'255'		;Se carga CONTATORE_1 con 255 (valor
	MOVWF	CONTATORE_1	;mÆximo cargable en un octeto).
	MOVF	CICLO,0		;Transferencia de CICLO a W.
	SUBWF	CONTATORE_1,1	;Resta de 255 y el contenido de
				;CICLO (aqu : 255-127 = 128).	
T_OFF	
	BCF	PORTB,1		;Se lleva a 0 la salida RB0 (se apaga
	BCF	PORTB,3			;el diodo LED).
	CALL	DELAY_15s	;Se llama la temporizaci n y se
	DECFSZ	CONTATORE_1,1	;repite por el nœmero de veces
	GOTO	T_OFF		;especificado en CONTATORE_1 (aqui: 128).
	GOTO	INIZIO

DELAY_15s
	MOVLW	d'2'
	MOVWF	CONTATORE_2
TEMPO
	NOP
	DECFSZ	CONTATORE_2,1
	GOTO	TEMPO
	GOTO	FINE

FINE
	RETURN


END
