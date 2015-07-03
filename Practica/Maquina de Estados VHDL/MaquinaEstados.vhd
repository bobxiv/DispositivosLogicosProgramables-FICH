--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:    14:11:24 09/27/11
-- Design Name:    
-- Module Name:    MaquinaEstados - Behavioral
-- Project Name:   
-- Target Device:  
-- Tool versions:  
-- Description:
--
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
--------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity MaquinaEstados is
    Port ( in1 : in std_logic;
           in2 : in std_logic;
			  clock : in  std_logic;
			  reset : in  std_logic;
           out1 : out std_logic;
           out2 : out std_logic);
end MaquinaEstados;

architecture Behavioral of MaquinaEstados is
	type estado is(E0, E1, E2);
	signal estado_A: estado := E0;
	signal estado_F: estado;
begin

		process(estado_A, in1, in2)--Comb
			begin
				case estado_A is
					when E0 =>
						out1 <= '0';
						out2 <= '0';
						estado_F <= E1;
					when E1 =>
						out1 <= '1';
						if in1='1' then
							estado_F <= E2;
						else
							estado_F <= E0;
						end if;
					when E2 =>
						out1 <= '1';
						out2 <= '1';
						estado_F <= E2;
				end case;
			end process;

		process--Registro
			begin
				wait until reset='1' or rising_edge(clock);
				if reset='1' then
					estado_A <= E0;
				else
					estado_A <= estado_F;
				end if;
			end process;


end Behavioral;
