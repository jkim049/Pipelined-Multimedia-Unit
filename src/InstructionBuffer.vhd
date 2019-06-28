-------------------------------------------------------------------------------
--
-- Title       : InstructionBuffer
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

--{{ Section below this comment is automatically maintained
--   and may be overwritten
--{entity {InstructionBuffer} architecture {behavioral}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use ieee.numeric_std.all;

entity InstructionBuffer is	   
	
	port( 	 		  
		clk, wr_en  : in std_logic;
		address 	: in std_logic_vector(4 downto 0);	 
		
		buffer_in0  : in 	std_logic_vector( 23 downto 0); 
		buffer_in1  : in 	std_logic_vector( 23 downto 0);	
		buffer_in2  : in 	std_logic_vector( 23 downto 0);
		buffer_in3  : in 	std_logic_vector( 23 downto 0);
		buffer_in4  : in 	std_logic_vector( 23 downto 0);
		buffer_in5  : in 	std_logic_vector( 23 downto 0);
		buffer_in6  : in 	std_logic_vector( 23 downto 0);
		buffer_in7  : in 	std_logic_vector( 23 downto 0);
		buffer_in8  : in 	std_logic_vector( 23 downto 0);
		buffer_in9  : in 	std_logic_vector( 23 downto 0);
		buffer_in10 : in 	std_logic_vector( 23 downto 0);
		buffer_in11 : in 	std_logic_vector( 23 downto 0);
		buffer_in12 : in 	std_logic_vector( 23 downto 0);
		buffer_in13 : in 	std_logic_vector( 23 downto 0);
		buffer_in14 : in 	std_logic_vector( 23 downto 0);
		buffer_in15 : in 	std_logic_vector( 23 downto 0);
		buffer_in16 : in 	std_logic_vector( 23 downto 0);   
		buffer_in17 : in 	std_logic_vector( 23 downto 0);
		buffer_in18 : in 	std_logic_vector( 23 downto 0);
		buffer_in19 : in 	std_logic_vector( 23 downto 0);
		buffer_in20 : in 	std_logic_vector( 23 downto 0);
		buffer_in21 : in 	std_logic_vector( 23 downto 0);
		buffer_in22 : in 	std_logic_vector( 23 downto 0); 
		buffer_in23 : in 	std_logic_vector( 23 downto 0);
		buffer_in24 : in 	std_logic_vector( 23 downto 0);
		buffer_in25 : in 	std_logic_vector( 23 downto 0);
		buffer_in26 : in 	std_logic_vector( 23 downto 0);
		buffer_in27 : in 	std_logic_vector( 23 downto 0);
		buffer_in28 : in 	std_logic_vector( 23 downto 0);
		buffer_in29 : in 	std_logic_vector( 23 downto 0);
		buffer_in30 : in 	std_logic_vector( 23 downto 0); 
		buffer_in31 : in 	std_logic_vector( 23 downto 0);
		
												 
		buffer_out 	: out   std_logic_vector( 23 downto 0)
	);
	
	
	
end InstructionBuffer;

--}} End of automatically maintained section

architecture behavioral of InstructionBuffer is	   

type instruction_buffer is array (31 downto 0) of std_logic_vector(23 downto 0);  
signal instruction_buffer_sig : instruction_buffer := (others => (others => '0') );	 


begin

	buffer_out <= instruction_buffer_sig ( to_integer(unsigned(address)) );
	
	process (clk)
	begin
		if (rising_edge(clk) and wr_en = '1') then
			instruction_buffer_sig (0)  <= buffer_in0; 
			instruction_buffer_sig (1)  <= buffer_in1; 
			instruction_buffer_sig (2)  <= buffer_in2; 
			instruction_buffer_sig (3)  <= buffer_in3; 
			instruction_buffer_sig (4)  <= buffer_in4; 
			instruction_buffer_sig (5)  <= buffer_in5; 
			instruction_buffer_sig (6)  <= buffer_in6; 
			instruction_buffer_sig (7)  <= buffer_in7; 
			instruction_buffer_sig (8)  <= buffer_in8; 
			instruction_buffer_sig (9)  <= buffer_in9; 
			instruction_buffer_sig (10) <= buffer_in10; 
			instruction_buffer_sig (11) <= buffer_in11; 
			instruction_buffer_sig (12) <= buffer_in12; 
			instruction_buffer_sig (13) <= buffer_in13; 
			instruction_buffer_sig (14) <= buffer_in14; 
			instruction_buffer_sig (15) <= buffer_in15; 
			instruction_buffer_sig (16) <= buffer_in16; 
			instruction_buffer_sig (17) <= buffer_in17; 
			instruction_buffer_sig (18) <= buffer_in18; 
			instruction_buffer_sig (19) <= buffer_in19; 
			instruction_buffer_sig (20) <= buffer_in20; 
			instruction_buffer_sig (21) <= buffer_in21; 
			instruction_buffer_sig (22) <= buffer_in22; 
			instruction_buffer_sig (23) <= buffer_in23; 
			instruction_buffer_sig (24) <= buffer_in24; 
			instruction_buffer_sig (25) <= buffer_in25; 
			instruction_buffer_sig (26) <= buffer_in26; 
			instruction_buffer_sig (27) <= buffer_in27; 
			instruction_buffer_sig (28) <= buffer_in28; 
			instruction_buffer_sig (29) <= buffer_in29; 
			instruction_buffer_sig (30) <= buffer_in30; 
			instruction_buffer_sig (31) <= buffer_in31; 
	   end if;		
	   
	end process;
	
end behavioral;
