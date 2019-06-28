-------------------------------------------------------------------------------
--
-- Title       : I_Type
-- Design      : MultimediaUnit
-- Author      : Reynerio Rubio and John Kim
-- Company     : Stony Brook University
--
-------------------------------------------------------------------------------
--
-- File        : c:\Users\rrubio04\OneDrive\Fall 2017\ESE 345\ESE_345_PROJECT\CellLiteUnit\src\InstructionSelect.vhd
-- Generated   : Fri Dec  1 21:56:32 2017
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

entity I_Type is	  
	
	port(  	
		instruction_type	:	in std_logic_vector(1 downto 0);  					--instruction[23:22]
		li_in				:	in std_logic_vector(1 downto 0) := (others =>'0');	--instruction[22:21]	 
		immediate_in		:	in std_logic_vector(15 downto 0) := (others =>'0'); --instruction[20:5]	
		rd_data_in 			:	in std_logic_vector(63 downto 0) := (others =>'0');
		
		data_out			:	out std_logic_vector(63 downto 0) := (others =>'0')	   
											   
	);
	
end I_Type;
											   

architecture behavioral of I_Type is	  
--signal instruction_type_sig 	:  std_logic_vector(1 downto 0) := (others =>'0');
begin							 
	Process (instruction_type, li_in, immediate_in, rd_data_in) begin		
		
		-- I TYPE	   
		if (instruction_type = "10" or instruction_type = "11") then
			
			if (li_in = "11") then  
				data_out <= immediate_in & 
							rd_data_in(47 downto 0);   
			elsif (li_in = "10") then
				data_out <= rd_data_in(63 downto 48) & 
							immediate_in & 
							rd_data_in(31 downto 0);
			elsif (li_in = "01") then
				data_out <= rd_data_in(63 downto 32) & 
							immediate_in & 
							rd_data_in(15 downto 0);
			elsif (li_in = "00") then
				data_out <= rd_data_in(63 downto 16) & 
							immediate_in;	  
			end if;					  
		end if;
		
	end process;
end behavioral;
