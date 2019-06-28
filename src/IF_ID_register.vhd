-------------------------------------------------------------------------------
--
-- Title       : IF_ID_register
-- Design      : MultimediaUnit
-- Author      : Reynerio Rubio and John Kim
-- Company     : Stony Brook University
--
-------------------------------------------------------------------------------
--
-- File        : C:\Users\rrubio04\OneDrive\Fall 2017\ESE 345\ESE_345_PROJECT\CellLiteUnit\src\IF_ID_register.vhd
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
--{entity {IF_ID_register} architecture {behavioral}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity IF_ID_register is 	
	
	port(
		clk				:	in std_logic;
		buffer_in		:	in std_logic_vector(23 downto 0);	
		instr_out		:	out std_logic_vector(23 downto 0) := (others =>'0')
	);	
		
end IF_ID_register;								   

architecture behavioral of IF_ID_register is   

signal instr_sig : std_logic_vector(23 downto 0);		 

begin
	process (clk) begin	
		
		if (rising_edge(clk)) then
			instr_sig <= buffer_in;
		end if;		
		
		if(falling_edge(clk)) then
			instr_out <= buffer_in;
		end if;	
		
	end process;						  

end behavioral;
