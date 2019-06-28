-------------------------------------------------------------------------------
--
-- Title       : ProgramCounter
-- Design      : MultimediaUnit
-- Author      : Reynerio Rubio and John Kim
-- Company     : Stony Brook University
--
-------------------------------------------------------------------------------
--
-- File        : C:\Users\rrubio04\OneDrive\Fall 2017\ESE 345\ESE_345_PROJECT\CellLiteUnit\src\ProgramCounter.vhd
-- Generated   : Thu Nov 16
-- From        : interface description file
-- By          : Itf2Vhdl ver. 1.22
--
-------------------------------------------------------------------------------
--
-- Description : 
--
-------------------------------------------------------------------------------

--{{ Section below this comment is automatically maintained
--   and may be overwritten
--{entity {ProgramCounter} architecture {behavioral}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;   
use ieee.numeric_std.all;

entity ProgramCounter is	
	port(
	clk		:	in std_logic;
	reset	:	in std_logic;
	pc_out	:	out std_logic_vector (4 downto 0)
	);	  
end ProgramCounter;

--}} End of automatically maintained section

architecture behavioral of ProgramCounter is
	signal pc_sig	:	integer:= 0;
begin
	process	(clk) begin
		if	rising_edge(clk) then
			if (pc_sig = 31) then
				pc_sig <= 0;
			else
				pc_sig <= pc_sig + 1;
			end if;
			pc_out <= std_logic_vector(to_unsigned(pc_sig,5));
		end if;
	end process;

end behavioral;
