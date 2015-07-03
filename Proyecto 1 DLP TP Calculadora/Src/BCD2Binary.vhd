----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    08:02:41 10/09/2011 
-- Design Name: 
-- Module Name:    BCD2Binary - BCD2BinaryArchitecture 
-- Project Name: 
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

entity BCD2Binary is
    Port ( bcd : in  STD_LOGIC_VECTOR(3 downto 0);
           binary : out  STD_LOGIC_VECTOR(7 downto 0));
end BCD2Binary;

architecture BCD2BinaryArchitecture of BCD2Binary is
begin
	binary(3 downto 0) <= bcd;
	binary(7 downto 4) <= "0000";
end BCD2BinaryArchitecture;

