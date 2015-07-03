----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:00:40 10/08/2011 
-- Design Name: 
-- Module Name:    ArithmeticModule - ArithmeticArchitecture 
-- Project Name:	 DLP Proyecto Codename Calculadora
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;

entity ArithmeticModule is
    Port ( A : in  STD_LOGIC_VECTOR(7 downto 0);--Primer operando(valor binario)
           B : in  STD_LOGIC_VECTOR(7 downto 0);--Segundo operando(valor binario)
           Op : in  STD_LOGIC_VECTOR(1 downto 0);--Operador
           Res : out  STD_LOGIC_VECTOR(15 downto 0));--Resultado de la operacion(valor binario)
end ArithmeticModule;

architecture ArithmeticArchitecture of ArithmeticModule is
begin

	PROCESS(A, B, Op)
	BEGIN
		CASE Op IS
			WHEN "00" => --Suma
				Res(7 downto 0) <= A+B;
				Res(15 downto 8) <= "00000000";
			WHEN "01" => --Resta
				Res(7 downto 0) <= A-B;
				Res(15 downto 8) <= "00000000";
			WHEN "10" =>--Multiplicacion
				Res <= A*B;
			WHEN "11" =>--Division NO IMPLEMENTADA TODAVIA
				Res <= "1111111111111111";
			when others =>
				Res <= "1111111111111111";
		END CASE;
	END PROCESS;


end ArithmeticArchitecture;

