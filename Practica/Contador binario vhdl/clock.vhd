--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:    14:06:03 10/20/11
-- Design Name:    
-- Module Name:    Binary Counter. 8 bits. Reset asinc. Clock enable.
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

--Entidad de un contador binario de 8 bits con reset asincronico
--linea de clock enable, y flanco decreciente de reloj
entity ContadorBinario is
	port(	clock : in  std_logic;
			clock_enable : in  std_logic;
			reset : in  std_logic;
			count_direction : in std_logic;
		   count : out std_logic_vector(7 downto 0) );
end ContadorBinario;

--Contador binario con:
--clock_enable(CE) -> habilita o desabilita
--reset -> ante un 1 asincronicamente(es como el clock) pone todo a 0
--count_direction(Up/Down) -> Si es 1 aumenta el contador, si es 0 disminuye el clock
architecture ContadorBinarioArchitecture of ContadorBinario is
	--la señal temporal es para llevar el conteo, si usaria count
	--como lo tengo que leer para incrementarlo deberia ser de inout 
	--en vez de solo out
	signal count_temp : std_logic_vector(7 downto 0);
begin
	process (clock, reset)--el proceso se activa al modificar el clock o reset 
	begin
	   if reset='1' then 
	      count_temp <= (others => '0');--resetea todo
	   elsif clock='1' and clock'event then--osea rising_edge(clock) flanco...
	      if clock_enable='1' then
	         if count_direction='1' then   
	            count_temp <= count_temp + 1;--incremento
	         else
	            count_temp <= count_temp - 1;--decremento
	         end if;
	      end if;
	   end if;
		count <= count_temp;
	end process;
 
end ContadorBinarioArchitecture;
