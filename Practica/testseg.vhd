
--------------------------------------------------------------------------------
-- Company:  Universidad de Valencia
-- Engineer: Alfredo Rosado
--
-- Create Date:   10:58:12 10/16/2006
-- Design Name:   segmentos
-- Module Name:   C:/Xilinx/prac1/prac1b/testseg.vhd
-- Project Name:  prac1b
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: segmentos
--
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends 
-- that these types always be used for the top-level I/O of a design in order 
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.all;
USE ieee.numeric_std.ALL;

ENTITY testseg_vhd IS
END testseg_vhd;

ARCHITECTURE behavior OF testseg_vhd IS 

	-- Component Declaration for the Unit Under Test (UUT)
	COMPONENT segmentos
	PORT(
		Reloj : IN std_logic;
		Reset : IN std_logic;
		interruptor : IN std_logic_vector(3 downto 0);          
		abcdefgdp : OUT std_logic_vector(7 downto 0);
		anodos : BUFFER std_logic_vector(3 downto 0)
		);
	END COMPONENT;

	--Inputs
	SIGNAL Reloj :  std_logic := '0';
	SIGNAL Reset :  std_logic := '0';
	SIGNAL interruptor :  std_logic_vector(3 downto 0) := (others=>'0');

	--Outputs
	SIGNAL abcdefgdp :  std_logic_vector(7 downto 0);
	SIGNAL anodos :  std_logic_vector(3 downto 0);

BEGIN

	-- Instantiate the Unit Under Test (UUT)
	uut: segmentos PORT MAP(
		Reloj => Reloj,
		Reset => Reset,
		interruptor => interruptor,
		abcdefgdp => abcdefgdp,
		anodos => anodos
	);

	tb : PROCESS
	BEGIN
	
		-- Wait 100 ns for global reset to finish
		wait for 100 ns;
		Reset <= '1';
		wait for 15 ns;
		reset <= '0';
		wait; -- will wait forever
	END PROCESS;

	tb2 : PROCESS
	BEGIN
		Reloj <= '1';
		wait for 10 ns;
		Reloj <= '0';
		wait for 10 ns; 
	END PROCESS;

	tb3 : PROCESS
	BEGIN
		interruptor <= "0000";
		wait for 1000 ns;
		interruptor(0) <= '1';
		wait for 1000 ns; 
		interruptor(0) <= '0';
		interruptor(1) <= '1';		
		wait for 1000 ns; 
		interruptor(1) <= '0';
		interruptor(2) <= '1';		
		wait for 1000 ns; 
		interruptor(2) <= '0';
		interruptor(3) <= '1';		
		wait for 1000 ns; 
		interruptor(3) <= '0';
		interruptor(0) <= '1';		
		wait for 1000 ns; 
		interruptor(0) <= '0';
		interruptor(1) <= '1';		
		wait for 1000 ns; 
		interruptor(1) <= '0';
		interruptor(2) <= '1';		
		wait for 1000 ns; 
		interruptor(2) <= '0';
		interruptor(3) <= '1';		
		wait for 1000 ns; 
		interruptor(3) <= '0';
		interruptor(0) <= '1';		
		wait for 1000 ns; 
		interruptor(0) <= '0';
		interruptor(1) <= '1';		
		wait for 1000 ns; 
		interruptor(1) <= '0';
		interruptor(2) <= '1';		
		wait for 1000 ns; 
		interruptor(2) <= '0';
		interruptor(3) <= '1';		
		wait for 1000 ns; 
		interruptor(3) <= '0';
		interruptor(0) <= '1';		
		wait;
	END PROCESS;

END;
