-------------------------------------------------------------------------------
--
-- Title       : RegisterUnit
-- Design      : MultimediaUnit
-- Author      : Reynerio Rubio and John Kim
-- Company     : Stony Brook University
--
-------------------------------------------------------------------------------
--
-- File        : C:\Users\rrubio04\OneDrive\Fall 2017\ESE 345\ESE_345_PROJECT\CellLiteUnit\src\RegisterUnit.vhd
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
--{entity {RegisterUnit} architecture {behavioral}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use ieee.numeric_std.all;

entity RegisterFile is	  
	
	port(		 	 
		-- 32 x 64-BIT REGISTERS
		rs1_addr_in		:	in std_logic_vector(4 downto 0) := (others => '0');
		rs2_addr_in		:	in std_logic_vector(4 downto 0) := (others => '0');	
		rs3_addr_in		:	in std_logic_vector(4 downto 0) := (others => '0');	
		read_rd_addr_in	:  	in std_logic_vector(4 downto 0) := (others => '0'); 
		
		wr_rd_addr_in	:	in std_logic_vector(4 downto 0) := (others => '0');
		
		
		rs1_data_out	:	out std_logic_vector(63 downto 0) := (others => '0');
		rs2_data_out	:	out std_logic_vector(63 downto 0) := (others => '0');	
		rs3_data_out	:	out std_logic_vector(63 downto 0) := (others => '0');	
		rd_data_out		:	out std_logic_vector(63 downto 0) := (others => '0');
		
		
		rd_data_in		:	in std_logic_vector (63 downto 0):=(others => '0');		
		write_en		:	in std_logic;
					 
		clk 			:	in std_logic
		
		);	  
	
	
end RegisterFile;
												 

architecture behavioral of RegisterFile is

-- INTERNAL SIGNALS AND DATATYPE
signal rs1_data_sig, rs2_data_sig, rs3_data_sig, rd_data_sig	:	std_logic_vector(63 downto 0); 
signal select_rs1, select_rs2, select_rs3, select_rd						:	std_logic;

type ResgisterFileArray is array (0 to 31) of std_logic_vector (63 downto 0); 
signal RegisterFile_sig							:	ResgisterFileArray := (others => (others =>'0'));	   


begin

	Process (clk, rd_data_in, rs1_addr_in, rs2_addr_in, rs3_addr_in)
	begin	
		-- USE ADDRESS TO GET DATA FROM REGISTER FILE
		rs1_data_sig <= RegisterFile_sig(to_integer(unsigned(rs1_addr_in)));
		rs2_data_sig <= RegisterFile_sig(to_integer(unsigned(rs2_addr_in)));
		rs3_data_sig <= RegisterFile_sig(to_integer(unsigned(rs3_addr_in)));		   
		rd_data_sig  <= RegisterFile_sig(to_integer(unsigned(read_rd_addr_in)));	
		
		-- WRITE TO RD
		if (falling_edge(clk) and write_en ='1' ) then  
			RegisterFile_sig(to_integer(unsigned(wr_rd_addr_in))) <= rd_data_in;
		end if;
		
		-- SELECT WRITE BYPASS FOR RS1 ('1' == write bypass, '0' == normal)
		if rs1_addr_in = wr_rd_addr_in then
			select_rs1 <= '1'; 
		else
			select_rs1 <= '0';
		end if ;
		
		-- SELECT WRITE BYPASS FOR RS2 ('1' == write bypass, '0' == normal)
		if rs2_addr_in = wr_rd_addr_in then 
			select_rs2 <= '1'; 
			
		else
			select_rs2 <= '0';
		end if;
		
		-- SELECT WRITE BYPASS FOR RS3 ('1' == write bypass, '0' == normal)
		if rs3_addr_in = wr_rd_addr_in then
			select_rs3 <= '1'; 
		else
			select_rs3 <= '0';
		end if ;  
		
		-- SELECT WRITE BYPASS FOR RD ('1' == write bypass, '0' == normal)
		if read_rd_addr_in = wr_rd_addr_in then
			select_rd <= '1'; 
		else
			select_rd <= '0';
		end if ;  
									
		
	end process;
	
	-- PORT MAPPING FOR RS1, RS2, RS3
	mux_rs1: entity mux_RegisterFile port map (normal => rs1_data_sig, write_bypass=> rd_data_in, selection => select_rs1, data_out => rs1_data_out);	
	mux_rs2: entity mux_RegisterFile port map (normal => rs2_data_sig, write_bypass=> rd_data_in, selection => select_rs2, data_out => rs2_data_out);	   
	mux_rs3: entity mux_RegisterFile port map (normal => rs3_data_sig, write_bypass=> rd_data_in, selection => select_rs3, data_out => rs3_data_out);
	mux_rd : entity mux_RegisterFile port map (normal => rd_data_sig, write_bypass=> rd_data_in, selection => select_rd, data_out => rd_data_out);
		
end behavioral;
