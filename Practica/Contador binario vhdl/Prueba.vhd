
--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:54:41 09/20/2011
-- Design Name:   contadorbinario
-- Module Name:   Prueba.vhd
-- Project Name:  teste
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: contadorbinario
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

ENTITY Prueba_vhd IS
END Prueba_vhd;

ARCHITECTURE behavior OF Prueba_vhd IS 

	-- Component Declaration for the Unit Under Test (UUT)
	COMPONENT contadorbinario
	PORT(
		clock : IN std_logic;
		clock_enable : IN std_logic;
		reset : IN std_logic;
		count_direction : IN std_logic;          
		count : OUT std_logic_vector(7 downto 0)
		);
	END COMPONENT;

	--Inputs
	SIGNAL clock :  std_logic := '0';
	SIGNAL clock_enable :  std_logic := '0';
	SIGNAL reset :  std_logic := '0';
	SIGNAL count_direction :  std_logic := '0';

	--Outputs
	SIGNAL count :  std_logic_vector(7 downto 0);

BEGIN

	-- Instantiate the Unit Under Test (UUT)
	uut: contadorbinario PORT MAP(
		clock => clock,
		clock_enable => clock_enable,
		reset => reset,
		count_direction => count_direction,
		count => count
	);

	tb : PROCESS
	BEGIN

		-- Wait 100 ns for global reset to finish
		wait for 100 ns;

		-- Place stimulus here

		wait; -- will wait forever
	END PROCESS;

END;
