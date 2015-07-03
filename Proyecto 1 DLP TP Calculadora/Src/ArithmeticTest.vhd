--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   23:03:50 10/08/2011
-- Design Name:   
-- Module Name:   C:/Users/BOB/Calculadora/Source/ArithmeticTest.vhd
-- Project Name:  Calculadora
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ArithmeticModule
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
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY ArithmeticTest IS
END ArithmeticTest;
 
ARCHITECTURE behavior OF ArithmeticTest IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ArithmeticModule
    PORT(
         A : IN  std_logic_vector(7 downto 0);
         B : IN  std_logic_vector(7 downto 0);
         Op : IN  std_logic_vector(1 downto 0);
         Res : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector(7 downto 0) := (others => '0');
   signal B : std_logic_vector(7 downto 0) := (others => '0');
   signal Op : std_logic_vector(1 downto 0) := (others => '0');

 	--Outputs
   signal Res : std_logic_vector(15 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   --constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ArithmeticModule PORT MAP (
          A => A,
          B => B,
          Op => Op,
          Res => Res
        );

   -- Clock process definitions
   --<clock>_process :process
   --begin
		--<clock> <= '0';
		--wait for <clock>_period/2;
		--<clock> <= '1';
		--wait for <clock>_period/2;
   --end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      --wait for <clock>_period*10;

      -- Estimulos:
		-- ----------
		
		
		
		
		
		--Prueba de la operacion de suma
		--Prueba 1  Comienza a 100ns
		A <= "00000001";--1
		B <= "00001000";--8
		OP <= "00";--Suma
		--Res deberia tener 9, osea 00001001b
		wait for 100 ns;
		
		--Prueba 2  Comienza a 200ns
		A <= "00000001";--1
		B <= "00000001";--1
		OP <= "00";--Suma
		--Res deberia tener 2, osea 00000010b
		wait for 100 ns;
		
		--Prueba 3  Comienza a 300ns
		A <= "00000101";--5
		B <= "00000011";--3
		OP <= "00";--Suma
		--Res deberia tener 8, osea 00001000b
		wait for 100 ns;	
		
		
		--Prueba de la operacion de resta
		--Prueba 1  Comienza a 400ns
		A <= "00001000";--8
		B <= "00000001";--1
		OP <= "01";--Resta
		--Res deberia tener 7, osea 00000111b
		wait for 100 ns;
		
		--Prueba 2  Comienza a 500ns
		A <= "00000001";--1
		B <= "00000001";--1
		OP <= "01";--Resta
		--Res deberia tener 0, osea 00000000b
		wait for 100 ns;
		
		--Prueba 3  Comienza a 600ns
		A <= "00000101";--5
		B <= "00000011";--3
		OP <= "01";--Resta
		--Res deberia tener 2, osea 00000010b
		wait for 100 ns;	
		
		
		
		--Prueba de la operacion de multiplicacion
		--Prueba 1  Comienza a 700ns
		A <= "00001000";--8
		B <= "00000001";--1
		OP <= "10";--Multiplicacion
		--Res deberia tener 8, osea 00001000b
		wait for 100 ns;
		
		--Prueba 2  Comienza a 800ns
		A <= "00000011";--3
		B <= "00000111";--7
		OP <= "10";--Multiplicacion
		--Res deberia tener 21, osea 00010101b
		wait for 100 ns;
		
		--Prueba 3  Comienza a 900ns
		A <= "00000101";--5
		B <= "00000011";--3
		OP <= "10";--Multiplicacion
		--Res deberia tener 15, osea 00001111b
		wait for 100 ns;	
		

      wait;
   end process;

END;
