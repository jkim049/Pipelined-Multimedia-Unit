-------------------------------------------------------------------------------
--
-- Title       : mux_r3
-- Design      : MultimediaUnit
-- Author      : Reynerio Rubio and John Kim
-- Company     : Stony Brook University
--
-------------------------------------------------------------------------------
--
-- File        : c:\Users\rrubio04\OneDrive\Fall 2017\ESE 345\ESE_345_PROJECT\CellLiteUnit\src\mux_r3.vhd
-- Generated   : Sat Dec  2 23:24:10 2017
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
--{entity {mux_r3} architecture {behavior}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity mux_r3 is   
	port (
		data_in_lsr			:	in std_logic_vector(63 downto 0);
		data_in_arithmetic	:	in std_logic_vector(63 downto 0); 	
		selection 			:	in std_logic; 	--instruction[18] 
		
		data_out_r3			:	out std_logic_vector(63 downto 0)
	);
end mux_r3;										

architecture behavior of mux_r3 is
begin
	process(data_in_lsr, data_in_arithmetic, selection) begin
		if(selection = '0') then
	 		data_out_r3 <= data_in_lsr;
		else
			data_out_r3 <= data_in_arithmetic;	 	
		end if;
	end process;
end behavior;
