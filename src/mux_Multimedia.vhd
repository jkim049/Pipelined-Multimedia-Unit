-------------------------------------------------------------------------------
--
-- Title       : mux_Multimedia
-- Design      : MultimediaUnit
-- Author      : Reynerio Rubio and John Kim
-- Company     : Stony Brook University
--
-------------------------------------------------------------------------------
--
-- File        : C:\Users\rrubio04\OneDrive\Fall 2017\ESE 345\ESE_345_PROJECT\CellLiteUnit\src\InstructionBuffer.vhd
-- Generated   : Thu Nov 16
-- From        : interface description file
-- By          : Itf2Vhdl ver. 1.22
--
-------------------------------------------------------------------------------
--
-- Description : 
--
-------------------------------------------------------------------------------



library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity mux_Multimedia is
	port(
		data_in_R3_type		:	in std_logic_vector(63 downto 0);	-- instruction_type = 00
		data_in_R4_type		:	in std_logic_vector(63 downto 0);	-- instruction_type = 01
		data_in_I_type		:	in std_logic_vector(63 downto 0);	-- instruction_type = 1-
		
		instruction_type	:	in std_logic_vector(1 downto 0);
		
		alu_data_out		:	out std_logic_vector(63 downto 0) 				
	);
end mux_Multimedia;
										 

architecture behavioral of mux_Multimedia is
begin

	process(data_in_R3_type, data_in_R4_type, data_in_I_type, instruction_type) begin
		if(instruction_type = "00") then
			alu_data_out <= data_in_R3_type;
		elsif(instruction_type = "01") then
			alu_data_out <= data_in_R4_type;
		elsif(instruction_type = "11")or (instruction_type = "10") then
			alu_data_out <= data_in_I_type;
		end if;
	end process;
	
end behavioral;
