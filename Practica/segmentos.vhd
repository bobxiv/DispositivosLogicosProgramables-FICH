--------------------------------------------------------------------------------
-- Company:  Universidad de Valencia
-- Engineer: Alfredo Rosado
--
-- Create Date:    12:28:58 10/14/06
-- Design Name:    
-- Module Name:    segmentos - Behavioral
-- Project Name:   Practica 1 de lab DCSE. Ingenieria Electronica. 
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

entity segmentos is
    Port ( Reloj : in std_logic;
           Reset : in std_logic;
			  interruptor : in std_logic_vector(3 downto 0);
			  abcdefgdp : out std_logic_vector(7 downto 0);
           anodos : buffer std_logic_vector(3 downto 0));
end segmentos;

architecture Behavioral of segmentos is

signal relojint : std_logic:='0';
signal a, b, c, d, valor_disp : std_logic_vector (3 downto 0):="0000";
signal contador_anodo : std_logic_vector(1 downto 0):= "00";
signal contador : integer:=0;

component sieteseg is port (
	bin_u: in std_logic_vector (3 downto 0);
	bcd_u: out std_logic_vector (7 downto 0)			 
	);
end component;

begin

p1: process (reloj)

  begin
  	 if rising_edge(reloj) then
		if contador < 200000 then
			contador <= contador + 1;
		 elsif contador = 200000 then
		 	contador <= 0;
			relojint <= not relojint;
		end if;
	end if;
end process;

p2: process (reset, relojint)
  begin
  	 if reset = '1' then
			contador_anodo <= (others => '0');
    elsif rising_edge(relojint) then
			if contador_anodo < 3 then 
			    contador_anodo <= contador_anodo + 1;
			else contador_anodo <= (others => '0');
			end if;
	 end if;
end process;	 		

pa: process (reset,interruptor(0))
  begin
  	 if reset = '1' then
	   a <= "0000";
	 elsif rising_edge(interruptor(0)) then
			if a < 9 then 
			    a <= a +1;
			else a <= (others => '0');
			end if;
	end if;
end process;

pb: process (reset, interruptor(1))
  begin
  	 if reset = '1' then
	   b <= "0001";
	 elsif rising_edge(interruptor(1)) then
			if b < 9 then 
			    b <= b +1;
			else b <= (others => '0');
			end if;
	end if;
end process;

pc: process (reset,interruptor(2))
  begin
  	 if reset = '1' then
	   c <= "0010";
	 elsif rising_edge(interruptor(2)) then
			if c < 9 then 
			    c <= c +1;
			else c <= (others => '0');
			end if;
	end if;
end process;

pd: process (reset,interruptor(3))
  begin
  	 if reset = '1' then
	   d <= "0011";
	 elsif rising_edge(interruptor(3)) then
			if d < 9 then 
			    d <= d +1;
			else d <= (others => '0');
			end if;		
	end if;
end process;

with contador_anodo select
valor_disp <=	a when "00",	
			      b when "01",
			      c when "10",
			      d when "11",
			(others=>'0') when others;	

with contador_anodo select
anodos <="0111" when "00",	
			"1011" when "01",
			"1101" when "10",
			"1110" when "11",
			(others=>'0') when others;	

conversora: sieteseg port map (valor_disp,abcdefgdp);

end Behavioral;
