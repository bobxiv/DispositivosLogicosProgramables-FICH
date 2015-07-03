--------------------------------------------------------------------------------
-- Copyright (c) 1995-2005 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor: Xilinx
-- \   \   \/     Version: H.42
--  \   \         Application: netgen
--  /   /         Filename: contadorbinario_synthesis.vhd
-- /___/   /\     Timestamp: Tue Sep 20 14:51:22 2011
-- \   \  /  \ 
--  \___\/\___\
--             
-- Command	: -intstyle ise -ar Structure -w -ofmt vhdl -sim contadorbinario.ngc contadorbinario_synthesis.vhd 
-- Device	: xc3s200-5-ft256
-- Input file	: contadorbinario.ngc
-- Output file	: contadorbinario_synthesis.vhd
-- # of Entities	: 1
-- Design Name	: contadorbinario
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

entity contadorbinario is
  port (
    reset : in STD_LOGIC := 'X'; 
    count_direction : in STD_LOGIC := 'X'; 
    clock : in STD_LOGIC := 'X'; 
    clock_enable : in STD_LOGIC := 'X'; 
    count : out STD_LOGIC_VECTOR ( 7 downto 0 ) 
  );
end contadorbinario;

architecture Structure of contadorbinario is
  signal reset_IBUF : STD_LOGIC; 
  signal count_direction_IBUF : STD_LOGIC; 
  signal clock_BUFGP : STD_LOGIC; 
  signal clock_enable_IBUF : STD_LOGIC; 
  signal Q_n0001 : STD_LOGIC; 
  signal count_temp_n0002 : STD_LOGIC; 
  signal N10 : STD_LOGIC; 
  signal N3 : STD_LOGIC; 
  signal contadorbinario_count_temp_n0000_0_cyo : STD_LOGIC; 
  signal N4 : STD_LOGIC; 
  signal contadorbinario_count_temp_n0000_1_cyo : STD_LOGIC; 
  signal N5 : STD_LOGIC; 
  signal contadorbinario_count_temp_n0000_2_cyo : STD_LOGIC; 
  signal N6 : STD_LOGIC; 
  signal contadorbinario_count_temp_n0000_3_cyo : STD_LOGIC; 
  signal N7 : STD_LOGIC; 
  signal contadorbinario_count_temp_n0000_4_cyo : STD_LOGIC; 
  signal N8 : STD_LOGIC; 
  signal contadorbinario_count_temp_n0000_5_cyo : STD_LOGIC; 
  signal N9 : STD_LOGIC; 
  signal contadorbinario_count_temp_n0000_6_cyo : STD_LOGIC; 
  signal count_temp : STD_LOGIC_VECTOR ( 7 downto 0 ); 
  signal count_temp_n0000 : STD_LOGIC_VECTOR ( 7 downto 0 ); 
begin
  count_temp_6 : FDE
    port map (
      D => count_temp_n0000(6),
      CE => Q_n0001,
      C => clock_BUFGP,
      Q => count_temp(6)
    );
  count_temp_n00021_INV_0 : INV
    port map (
      I => count_direction_IBUF,
      O => count_temp_n0002
    );
  Q_n00011 : LUT2
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => clock_enable_IBUF,
      I1 => reset_IBUF,
      O => Q_n0001
    );
  count_temp_7 : FDE
    port map (
      D => count_temp_n0000(7),
      CE => Q_n0001,
      C => clock_BUFGP,
      Q => count_temp(7)
    );
  contadorbinario_count_temp_n0000_7_xor : XORCY
    port map (
      CI => contadorbinario_count_temp_n0000_6_cyo,
      LI => N10,
      O => count_temp_n0000(7)
    );
  count_temp_0 : FDE
    port map (
      D => count_temp_n0000(0),
      CE => Q_n0001,
      C => clock_BUFGP,
      Q => count_temp(0)
    );
  count_temp_1 : FDE
    port map (
      D => count_temp_n0000(1),
      CE => Q_n0001,
      C => clock_BUFGP,
      Q => count_temp(1)
    );
  count_temp_2 : FDE
    port map (
      D => count_temp_n0000(2),
      CE => Q_n0001,
      C => clock_BUFGP,
      Q => count_temp(2)
    );
  count_temp_3 : FDE
    port map (
      D => count_temp_n0000(3),
      CE => Q_n0001,
      C => clock_BUFGP,
      Q => count_temp(3)
    );
  count_temp_4 : FDE
    port map (
      D => count_temp_n0000(4),
      CE => Q_n0001,
      C => clock_BUFGP,
      Q => count_temp(4)
    );
  count_temp_5 : FDE
    port map (
      D => count_temp_n0000(5),
      CE => Q_n0001,
      C => clock_BUFGP,
      Q => count_temp(5)
    );
  contadorbinario_count_temp_n0000_7_lut : LUT2_L
    generic map(
      INIT => X"9"
    )
    port map (
      I0 => count_temp(7),
      I1 => count_direction_IBUF,
      LO => N10
    );
  count_1_OBUF : OBUF
    port map (
      I => count_temp(1),
      O => count(1)
    );
  count_0_OBUF : OBUF
    port map (
      I => count_temp(0),
      O => count(0)
    );
  contadorbinario_count_temp_n0000_0_cy : MUXCY
    port map (
      CI => count_temp_n0002,
      DI => count_temp(0),
      S => N3,
      O => contadorbinario_count_temp_n0000_0_cyo
    );
  contadorbinario_count_temp_n0000_0_xor : XORCY
    port map (
      CI => count_temp_n0002,
      LI => N3,
      O => count_temp_n0000(0)
    );
  contadorbinario_count_temp_n0000_0_lut : LUT2_L
    generic map(
      INIT => X"6"
    )
    port map (
      I0 => count_direction_IBUF,
      I1 => count_temp(0),
      LO => N3
    );
  contadorbinario_count_temp_n0000_1_cy : MUXCY
    port map (
      CI => contadorbinario_count_temp_n0000_0_cyo,
      DI => count_temp(1),
      S => N4,
      O => contadorbinario_count_temp_n0000_1_cyo
    );
  contadorbinario_count_temp_n0000_1_xor : XORCY
    port map (
      CI => contadorbinario_count_temp_n0000_0_cyo,
      LI => N4,
      O => count_temp_n0000(1)
    );
  contadorbinario_count_temp_n0000_1_lut : LUT2_L
    generic map(
      INIT => X"9"
    )
    port map (
      I0 => count_direction_IBUF,
      I1 => count_temp(1),
      LO => N4
    );
  contadorbinario_count_temp_n0000_2_cy : MUXCY
    port map (
      CI => contadorbinario_count_temp_n0000_1_cyo,
      DI => count_temp(2),
      S => N5,
      O => contadorbinario_count_temp_n0000_2_cyo
    );
  contadorbinario_count_temp_n0000_2_xor : XORCY
    port map (
      CI => contadorbinario_count_temp_n0000_1_cyo,
      LI => N5,
      O => count_temp_n0000(2)
    );
  contadorbinario_count_temp_n0000_2_lut : LUT2_L
    generic map(
      INIT => X"9"
    )
    port map (
      I0 => count_direction_IBUF,
      I1 => count_temp(2),
      LO => N5
    );
  contadorbinario_count_temp_n0000_3_cy : MUXCY
    port map (
      CI => contadorbinario_count_temp_n0000_2_cyo,
      DI => count_temp(3),
      S => N6,
      O => contadorbinario_count_temp_n0000_3_cyo
    );
  contadorbinario_count_temp_n0000_3_xor : XORCY
    port map (
      CI => contadorbinario_count_temp_n0000_2_cyo,
      LI => N6,
      O => count_temp_n0000(3)
    );
  contadorbinario_count_temp_n0000_3_lut : LUT2_L
    generic map(
      INIT => X"9"
    )
    port map (
      I0 => count_direction_IBUF,
      I1 => count_temp(3),
      LO => N6
    );
  contadorbinario_count_temp_n0000_4_cy : MUXCY
    port map (
      CI => contadorbinario_count_temp_n0000_3_cyo,
      DI => count_temp(4),
      S => N7,
      O => contadorbinario_count_temp_n0000_4_cyo
    );
  contadorbinario_count_temp_n0000_4_xor : XORCY
    port map (
      CI => contadorbinario_count_temp_n0000_3_cyo,
      LI => N7,
      O => count_temp_n0000(4)
    );
  contadorbinario_count_temp_n0000_4_lut : LUT2_L
    generic map(
      INIT => X"9"
    )
    port map (
      I0 => count_direction_IBUF,
      I1 => count_temp(4),
      LO => N7
    );
  contadorbinario_count_temp_n0000_5_cy : MUXCY
    port map (
      CI => contadorbinario_count_temp_n0000_4_cyo,
      DI => count_temp(5),
      S => N8,
      O => contadorbinario_count_temp_n0000_5_cyo
    );
  contadorbinario_count_temp_n0000_5_xor : XORCY
    port map (
      CI => contadorbinario_count_temp_n0000_4_cyo,
      LI => N8,
      O => count_temp_n0000(5)
    );
  contadorbinario_count_temp_n0000_5_lut : LUT2_L
    generic map(
      INIT => X"9"
    )
    port map (
      I0 => count_direction_IBUF,
      I1 => count_temp(5),
      LO => N8
    );
  contadorbinario_count_temp_n0000_6_cy : MUXCY
    port map (
      CI => contadorbinario_count_temp_n0000_5_cyo,
      DI => count_temp(6),
      S => N9,
      O => contadorbinario_count_temp_n0000_6_cyo
    );
  contadorbinario_count_temp_n0000_6_xor : XORCY
    port map (
      CI => contadorbinario_count_temp_n0000_5_cyo,
      LI => N9,
      O => count_temp_n0000(6)
    );
  contadorbinario_count_temp_n0000_6_lut : LUT2_L
    generic map(
      INIT => X"9"
    )
    port map (
      I0 => count_direction_IBUF,
      I1 => count_temp(6),
      LO => N9
    );
  clock_BUFGP_0 : BUFGP
    port map (
      I => clock,
      O => clock_BUFGP
    );
  reset_IBUF_1 : IBUF
    port map (
      I => reset,
      O => reset_IBUF
    );
  count_direction_IBUF_2 : IBUF
    port map (
      I => count_direction,
      O => count_direction_IBUF
    );
  clock_enable_IBUF_3 : IBUF
    port map (
      I => clock_enable,
      O => clock_enable_IBUF
    );
  count_7_OBUF : OBUF
    port map (
      I => count_temp(7),
      O => count(7)
    );
  count_6_OBUF : OBUF
    port map (
      I => count_temp(6),
      O => count(6)
    );
  count_5_OBUF : OBUF
    port map (
      I => count_temp(5),
      O => count(5)
    );
  count_4_OBUF : OBUF
    port map (
      I => count_temp(4),
      O => count(4)
    );
  count_3_OBUF : OBUF
    port map (
      I => count_temp(3),
      O => count(3)
    );
  count_2_OBUF : OBUF
    port map (
      I => count_temp(2),
      O => count(2)
    );

end Structure;

