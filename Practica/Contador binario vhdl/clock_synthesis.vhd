--------------------------------------------------------------------------------
-- Copyright (c) 1995-2005 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor: Xilinx
-- \   \   \/     Version: H.42
--  \   \         Application: netgen
--  /   /         Filename: clock_synthesis.vhd
-- /___/   /\     Timestamp: Tue Sep 13 14:22:03 2011
-- \   \  /  \ 
--  \___\/\___\
--             
-- Command	: -intstyle ise -ar Structure -w -ofmt vhdl -sim clock.ngc clock_synthesis.vhd 
-- Device	: xc3s200-5-ft256
-- Input file	: clock.ngc
-- Output file	: clock_synthesis.vhd
-- # of Entities	: 1
-- Design Name	: clock
-- Xilinx	: C:/Xilinx
--             
-- Purpose:    
--     This VHDL netlist is a verification model and uses simulation 
--     primitives which may not represent the true implementation of the 
--     device, however the netlist is functionally correct and should not 
--     be modified. This file cannot be synthesized and should only be used 
--     with supported simulation tools.
--             
-- Reference:  
--     Development System Reference Guide, Chapter 23
--     Synthesis and Verification Design Guide, Chapter 6
--             
--------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;

entity clock is
  port (
    clk : in STD_LOGIC := 'X'; 
    salida : out STD_LOGIC 
  );
end clock;

architecture Structure of clock is
  signal clk_IBUF : STD_LOGIC; 
  signal salida_OBUF : STD_LOGIC; 
begin
  salida_OBUF_0 : OBUF
    port map (
      I => salida_OBUF,
      O => salida
    );
  salida1_INV_0 : INV
    port map (
      I => clk_IBUF,
      O => salida_OBUF
    );
  clk_IBUF_1 : IBUF
    port map (
      I => clk,
      O => clk_IBUF
    );

end Structure;

