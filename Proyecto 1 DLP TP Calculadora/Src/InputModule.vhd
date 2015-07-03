----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Emmanuel Rojas Fredini
-- 
-- Create Date:    17:28:27 10/08/2011 
-- Design Name: 
-- Module Name:    CalculadoraFSM - CalculadoraStateMachineArchitecture 
-- Project Name:   Calculadora
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: ArithmeticModule.vhdl, BCD2Binary.vhdl
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

--Descripcion:
--La calculadora recibe su entrada en forma serie, recibiendo cada uno de los
--datos en forma little endian. Recibe los datos en el siguiente orden:
--						4 bits de un primer operando en formato bcd
--						2 bits del codigo del operador segun especifica el modulo de aritmetica(ArithmeticModule)
--						4 bits de un segundo operando en formato bcd
--Para volver a realizar otra operacion hay que enviar un reset a la calculadora ya que esta una vez
--que produce el resultado, esta se queda en un estado de espera infinito.
--
--El cambio de estado normal es sincronico pero el reset cambia el estado asincronicamente.
--El ouput de la calculadora antes de que se realize todo el input y luego la operacion aritmetica
--no esta establecido asi que no deberia tenerselo en cuenta.

entity CalculadoraFSM is
    Port ( input : in std_logic;--Entrada seria a la calculadora(se estima sincronizada con el clock)
			  clock : in  std_logic;--Clock de la maquina de estado finito
			  reset : in  std_logic;--Reset asincronico de la calculadora
           output : out std_logic_vector(15 downto 0));--resultado de la calculadora
end CalculadoraFSM;

architecture CalculadoraStateMachineArchitecture of CalculadoraFSM is
	type estado is(LeerBit1Op1, LeerBit2Op1, LeerBit3Op1, LeerBit4Op1, 
						LeerOpCodeBit1, LeerOpCodeBit2, 
						LeerBit1Op2, LeerBit2Op2, LeerBit3Op2, LeerBit4Op2,
						ConvertirBCD2Binario, Calcular, EsperarReset);
	
	--Estado actual
	signal estado_A: estado := LeerBit1Op1;
	--Estado siguiente
	signal estado_S: estado;
	
	--Componente de aritmetica
	COMPONENT ArithmeticModule
	PORT(
         A : IN  std_logic_vector(7 downto 0);
         B : IN  std_logic_vector(7 downto 0);
         Op : IN  std_logic_vector(1 downto 0);
         Res : OUT  std_logic_vector(15 downto 0)
        );
	END COMPONENT;
	
	--ArithmeticModule Inputs
   signal A : std_logic_vector(7 downto 0) := (others => '0');
   signal B : std_logic_vector(7 downto 0) := (others => '0');
   signal Op : std_logic_vector(1 downto 0) := (others => '0');

 	--ArithmeticModule Outputs
   signal Res : std_logic_vector(15 downto 0);
	
	--Componente de conversion de bcd a formato numerico binario
	COMPONENT BCD2Binary
	Port ( bcd : in  STD_LOGIC_VECTOR(3 downto 0);
          binary : out  STD_LOGIC_VECTOR(7 downto 0));
	END COMPONENT;
	
	--BCD2Binary 1 Inputs
   signal bcd1  : STD_LOGIC_VECTOR(3 downto 0) := (others => '0');

 	--BCD2Binary 1 Outputs
   signal binary1 : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
	
	--BCD2Binary 2 Inputs
   signal bcd2  : STD_LOGIC_VECTOR(3 downto 0) := (others => '0');

 	--BCD2Binary 2 Outputs
   signal binary2 : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
	
	
	--Almacena la entrada a la calculadora
	--No es totalmente necesario porque se podria cargar directamente en bcd1, bcd2 y Op 
	--pero cargarlo en este buffer hace que el proceso parezca mas secuencial y entendible
	signal bufferEntrada : STD_LOGIC_VECTOR(9 downto 0);
	
begin

		-- Instanciamos el Modulo de Aritmetica(AM)
		am: ArithmeticModule PORT MAP (
          A => A,
          B => B,
          Op => Op,
			 Res => output
          --Res => Res
        );
		  
		-- Instanciamos el Conversor de BCD a binario 1(bcd2binario1)
		bcd2binario1: BCD2Binary PORT MAP (
          bcd => bcd1,
          binary => binary1
        );
		  
		-- Instanciamos el Conversor de BCD a binario 2(bcd2binario2)
		bcd2binario2: BCD2Binary PORT MAP (
          bcd => bcd2,
          binary => binary2
        );

		--Proceso del siguiente estado de la maquina de estado finito
		SiguienteEstado: process(estado_A, input)
			begin
				case estado_A is
					--Estados de lectura de la entrada a la calculadora
					
					when LeerBit1Op1 =>
						bufferEntrada(0) <= input;
						estado_S <= LeerBit2Op1;
					when LeerBit2Op1 =>
						bufferEntrada(1) <= input;
						estado_S <= LeerBit3Op1;
					when LeerBit3Op1 =>
						bufferEntrada(2) <= input;
						estado_S <= LeerBit4Op1;
					when LeerBit4Op1 =>
						bufferEntrada(3) <= input;
						estado_S <= LeerOpCodeBit1;
					when LeerOpCodeBit1 =>
						bufferEntrada(4) <= input;
						estado_S <= LeerOpCodeBit2;
					when LeerOpCodeBit2 =>
						bufferEntrada(5) <= input;
						estado_S <= LeerBit1Op2;
					when LeerBit1Op2 =>
						bufferEntrada(6) <= input;
						estado_S <= LeerBit2Op2;
					when LeerBit2Op2 =>
						bufferEntrada(7) <= input;
						estado_S <= LeerBit3Op2;
					when LeerBit3Op2 =>
						bufferEntrada(8) <= input;
						estado_S <= LeerBit4Op2;
					when LeerBit4Op2 =>
						bufferEntrada(9) <= input;
						estado_S <= ConvertirBCD2Binario;
					--Conversion de los operandos de formato bcd a binario
					
					when ConvertirBCD2Binario =>--Convierte los valores numericos de bcd a formato binario
						bcd1 <= bufferEntrada(3 downto 0);
						bcd2 <= bufferEntrada(9 downto 6);
						estado_S <= Calcular;
					--Calculo de la operacion
						
					when Calcular =>--Realiza los calculos usanod el modulo de aritmetica
						A <= binary1;
						OP <= bufferEntrada(5 downto 4);
						B <= binary2;
						estado_S <= EsperarReset;
					--Espera que se resetee la calculadora para hacer otro calculo
					
					when EsperarReset =>
						estado_S <= EsperarReset;--seguimos hasta que halla un reset en este estado
				end case;
			end process SiguienteEstado;

		--Proceso de cambio de estado de la maquina de estado finito
		CambioEstadoSincronico: process
			begin
				wait until reset='1' or rising_edge(clock);
				if reset='1' then
					estado_A <= LeerBit1Op1;--resetea la maquina de estado finito
				else
					estado_A <= estado_S;--actualiza el estado actual al estado siguiente
				end if;
			end process CambioEstadoSincronico;


end CalculadoraStateMachineArchitecture;

