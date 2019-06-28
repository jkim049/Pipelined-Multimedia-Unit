-------------------------------------------------------------------------------
--
-- Title       : mux_RegisterFile
-- Design      : MultimediaUnit
-- Author      : Reynerio Rubio and John Kim
-- Company     : Stony Brook University
--
-------------------------------------------------------------------------------
--
-- File        : c:\Users\rrubio04\OneDrive\Fall 2017\ESE 345\ESE_345_PROJECT\CellLiteUnit\src\mux_RegisterFile.vhd
-- Generated   : Fri Dec  1 21:02:23 2017
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

entity mux_RegisterFile is	 
	port(
	normal			:	in std_logic_vector(63 downto 0) := (others => '0');
	write_bypass	:	in std_logic_vector(63 downto 0):=(others => '0');
	selection		:	in std_logic;
	data_out		:	out std_logic_vector(63 downto 0):=(others => '0')
	);
end mux_RegisterFile;
												

architecture behavioral of mux_RegisterFile is
begin

	process(selection, normal, write_bypass) begin
		if selection = '1' then
			data_out <= write_bypass;
		elsif selection = '0' then
			data_out <= normal;		
		else
			data_out <= (others =>'0');
		end if;
	end process;

end behavioral;
