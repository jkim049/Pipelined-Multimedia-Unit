-------------------------------------------------------------------------------
--
-- Title       : control_WriteBack
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

entity control_WriteBack is
	
	port(	  
	 	instruction			:	in std_logic_vector(23 downto 15);  	--instruction[23:15]   
	   	write_en			: 	out std_logic
	);
	
end control_WriteBack;



architecture behavioral of control_WriteBack is
begin
   	process(instruction) begin
		   
		if(instruction(23 downto 22) = "00") then
			
			if(instruction(18 downto 15) = "0000") then
				write_en <= '0';
			else
				write_en <= '1';
			end if;
		else
			write_en <= '1';
		end if;
	end process;

end behavioral;
