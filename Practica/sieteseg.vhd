library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity sieteseg is port(
	bin_u: in std_logic_vector (3 downto 0);
	bcd_u: out std_logic_vector (7 downto 0)
	);
end sieteseg;

architecture arq of sieteseg is

begin
with bin_u select
bcd_u <=	"00000010" when "0000",	--0
			"10011111" when "0001",	--1
			"00100100" when "0010",	--2
			"00001100" when "0011",	--3
			"10011000" when "0100",	--4
			"01001000" when "0101",	--5
			"11000000" when "0110",	--6
			"00011110" when "0111",	--7
			"00000000" when "1000",	--8
			"00010000" when "1001",	--9
			"11111111" when others;	
end arq;
