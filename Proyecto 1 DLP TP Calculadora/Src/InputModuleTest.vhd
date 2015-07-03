--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   08:27:52 10/09/2011
-- Design Name:   
-- Module Name:   C:/Users/BOB/Calculadora/Source/InputModuleTest.vhd
-- Project Name:  Calculadora
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: InputFSM
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
 
ENTITY CalculadoraTest IS
END CalculadoraTest;
 
ARCHITECTURE behavior OF CalculadoraTest IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT CalculadoraFSM
    PORT(
         input : IN  std_logic;
         clock : IN  std_logic;
         reset : IN  std_logic;
         output : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal input : std_logic := '0';
   signal clock : std_logic := '0';
   signal reset : std_logic := '0';

 	--Outputs
   signal output : std_logic_vector(15 downto 0);

   -- Clock period definitions
   constant clock_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: CalculadoraFSM PORT MAP (
          input => input,
          clock => clock,
          reset => reset,
          output => output
        );

   -- Clock process definitions
   clock_process :process
   begin
		clock <= '0';
		wait for clock_period/2;
		clock <= '1';
		wait for clock_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      --wait for 100 ns;


		-- Prueba de Multiplicacion: Resultado esperado 100100  ->   Osea 36
		-- bcd 1001  ->   Osea 9
		input <='1';
		wait for 10 ns;
		
		input <='0';
		wait for 10 ns;
		
		input <='0';
		wait for 10 ns;
		
		input <='1';
		wait for 10 ns;
		
		-- operacion Multiplicacion 10
		input <='0';
		wait for 10 ns;
		
		input <='1';
		wait for 10 ns;
		
		-- bcd 0100  ->   Osea 4
		input <='0';
		wait for 10 ns;
		
		input <='0';
		wait for 10 ns;
		
		input <='1';
		wait for 10 ns;
		
		input <='0';
		wait for 10 ns;		
		
		
		wait for 180 ns;-- Necesitamos un ciclo para realizar los calculos
							 -- y dejar 10 ns para mostrar los resultados
		
		reset <= '1';--Reseteamos
		wait for 10 ns;
		reset <= '0';
		
	
		-- Prueba de Suma: Resultado esperado 0011  ->   Osea 3
		-- bcd 0001  ->   Osea 1
		input <='1';
		wait for 10 ns;
		
		input <='0';
		wait for 10 ns;
		
		input <='0';
		wait for 10 ns;
		
		input <='0';
		wait for 10 ns;
		
		-- operacion Suma 00
		input <='0';
		wait for 10 ns;
		
		input <='0';
		wait for 10 ns;
		
		-- bcd 0010  ->   Osea 2
		input <='0';
		wait for 10 ns;
		
		input <='1';
		wait for 10 ns;
		
		input <='0';
		wait for 10 ns;
		
		input <='0';
		wait for 10 ns;
		
		
		
		wait for 180 ns;-- Necesitamos un ciclo para realizar los calculos
							 -- y dejar 10 ns para mostrar los resultados
		
		reset <= '1';--Reseteamos
		wait for 10 ns;
		reset <= '0';
		
		
		-- Prueba de Resta: Resultado esperado 0010  ->   Osea 2
		-- bcd 0101  ->   Osea 5
		input <='1';
		wait for 10 ns;
		
		input <='0';
		wait for 10 ns;
		
		input <='1';
		wait for 10 ns;
		
		input <='0';
		wait for 10 ns;
		
		-- operacion Resta 01
		input <='1';
		wait for 10 ns;
		
		input <='0';
		wait for 10 ns;
		
		-- bcd 0011  ->   Osea 3
		input <='1';
		wait for 10 ns;
		
		input <='1';
		wait for 10 ns;
		
		input <='0';
		wait for 10 ns;
		
		input <='0';
		wait for 10 ns;
			
		
		

      wait for clock_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
