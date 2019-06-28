-------------------------------------------------------------------------------
--
-- Title       : ID_EX_WB_register
-- Design      : MultimediaUnit
-- Author      : Reynerio Rubio and John Kim
-- Company     : Stony Brook University
--
-------------------------------------------------------------------------------
--
-- File        : c:\Users\rrubio04\OneDrive\Fall 2017\ESE 345\ESE_345_PROJECT\CellLiteUnit\src\ID_EX_WB_register.vhd
-- Generated   : Fri Dec  1 21:14:53 2017
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

entity ID_EX_WB_register is	  	   
	
	port(  
		rs1_data_in			:	in std_logic_vector(63 downto 0) := (others =>'0');
		rs2_data_in			:	in std_logic_vector(63 downto 0) := (others =>'0');
		rs3_data_in 		:	in std_logic_vector(63 downto 0) := (others =>'0');
		rd_data_in 			:	in std_logic_vector(63 downto 0) := (others =>'0');
		instruction_in		:	in std_logic_vector(23 downto 0) := (others =>'0');		   
		wr_rd_addr_in		:	in std_logic_vector(4 downto 0) := (others => '0');
												
		rs1_data_out		:	out std_logic_vector(63 downto 0) := (others =>'0');
		rs2_data_out		:	out std_logic_vector(63 downto 0) := (others =>'0');
		rs3_data_out		:	out std_logic_vector(63 downto 0) := (others =>'0');
		rd_data_out 		:	out std_logic_vector(63 downto 0) := (others =>'0');	
		instruction_out		:	out std_logic_vector(23 downto 0) := (others =>'0');	   
		wr_rd_addr_out		:	out std_logic_vector(4 downto 0) := (others => '0');							
		
		clk					:	in std_logic
	);
		 
end ID_EX_WB_register;
												   

architecture behavioral of ID_EX_WB_register is
	-- INTERNAL SIGNALS
	signal rs1_data_sig		:	std_logic_vector(63 downto 0) := (others =>'0');
	signal rs2_data_sig		:	std_logic_vector(63 downto 0) := (others =>'0');
	signal rs3_data_sig		:	std_logic_vector(63 downto 0) := (others =>'0');
	signal rd_data_sig		:	std_logic_vector(63 downto 0) := (others =>'0');
	signal instruction_sig	:	std_logic_vector(23 downto 0) := (others =>'0');  
	signal wr_rd_addr_sig	:	std_logic_vector(4 downto 0) := (others => '0');
begin	 
	
	Process (clk, rs1_data_in, rs2_data_in, rs3_data_in, instruction_in, wr_rd_addr_in)	
	begin 		 
		if rising_edge(clk) then  
			rs1_data_sig <= rs1_data_in;
			rs2_data_sig <= rs2_data_in;
			rs3_data_sig <= rs3_data_in;
			rd_data_sig  <= rd_data_in;
			instruction_sig <= instruction_in;
			wr_rd_addr_sig <= wr_rd_addr_in;
		end if;									
		
		if falling_edge(clk) then	
			rs1_data_out <= rs1_data_sig;
			rs2_data_out <= rs2_data_sig;
			rs3_data_out <= rs3_data_sig;
			rd_data_out <= rd_data_sig;
			instruction_out <= instruction_sig;
			wr_rd_addr_out	<= wr_rd_addr_sig;
		end if;
	end process;
	
end behavioral;
