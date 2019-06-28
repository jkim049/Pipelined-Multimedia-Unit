-------------------------------------------------------------------------------
--
-- Title       : multimedia_tb
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
use ieee.std_logic_textio.all;
use ieee.numeric_std.all; 
 use std.textio.all;		
use text_util.all;

entity multimedia_tb is
end multimedia_tb;
											 

architecture tb of multimedia_tb is



	signal buffer_in0	: 	std_logic_vector( 23 downto 0);	
	signal buffer_in1	: 	std_logic_vector( 23 downto 0);
	signal buffer_in2	: 	std_logic_vector( 23 downto 0);
	signal buffer_in3	: 	std_logic_vector( 23 downto 0);
	signal buffer_in4	: 	std_logic_vector( 23 downto 0);
	signal buffer_in5	: 	std_logic_vector( 23 downto 0);
	signal buffer_in6	: 	std_logic_vector( 23 downto 0);
	signal buffer_in7	: 	std_logic_vector( 23 downto 0);
	signal buffer_in8	: 	std_logic_vector( 23 downto 0);
	signal buffer_in9	: 	std_logic_vector( 23 downto 0);
	signal buffer_in10	: 	std_logic_vector( 23 downto 0);
	signal buffer_in11	: 	std_logic_vector( 23 downto 0);
	signal buffer_in12	: 	std_logic_vector( 23 downto 0);
	signal buffer_in13	: 	std_logic_vector( 23 downto 0);
	signal buffer_in14	: 	std_logic_vector( 23 downto 0); 
	signal buffer_in15	:	std_logic_vector( 23 downto 0);
	signal buffer_in16	:	std_logic_vector( 23 downto 0);
	signal buffer_in17	:	std_logic_vector( 23 downto 0);
	signal buffer_in18	:	std_logic_vector( 23 downto 0);
	signal buffer_in19	:	std_logic_vector( 23 downto 0);
	signal buffer_in20	: 	std_logic_vector( 23 downto 0);
	signal buffer_in21	:	std_logic_vector( 23 downto 0); 
	signal buffer_in22	:	std_logic_vector( 23 downto 0);
	signal buffer_in23	:	std_logic_vector( 23 downto 0);
	signal buffer_in24	:	std_logic_vector( 23 downto 0);
	signal buffer_in25	:	std_logic_vector( 23 downto 0);
	signal buffer_in26	:	std_logic_vector( 23 downto 0);
	signal buffer_in27	:	std_logic_vector( 23 downto 0);
	signal buffer_in28	: 	std_logic_vector( 23 downto 0);
	signal buffer_in29	:	std_logic_vector( 23 downto 0); 
	signal buffer_in30	:	std_logic_vector( 23 downto 0);
	signal buffer_in31	:	std_logic_vector( 23 downto 0); 
	
	signal wr_en		:	std_logic;
	signal reset		:	std_logic;
	
	signal clk			:	std_logic;
	signal clk_period	:	time := 10ns; 
	
	-- INSTRUCTION FETCH
	signal IF_buffer_sig			:	std_logic_vector(23 downto 0);
	
	-- INSTRUCTION DECODE
	signal ID_instruction_sig			:	std_logic_vector(23 downto 0);
	
	signal ID_read_rd_addr_sig			:	std_logic_vector(4 downto 0);
	signal ID_rs1_addr_sig				:	std_logic_vector(4 downto 0);
	signal ID_rs2_addr_sig				:	std_logic_vector(4 downto 0);
	signal ID_rs3_addr_sig				:	std_logic_vector(4 downto 0); 
	
	signal ID_rd_data_sig				:	std_logic_vector(63 downto 0);
	signal ID_rs1_data_sig				:	std_logic_vector(63 downto 0);
	signal ID_rs2_data_sig				:	std_logic_vector(63 downto 0);
	signal ID_rs3_data_sig				:	std_logic_vector(63 downto 0);
	signal ID_write_rd_addr_sig			:	std_logic_vector(4 downto 0);
	
	-- EXECUTION / WB
	signal EX_instruction_sig  	:	std_logic_vector(23 downto 0);	
	signal EX_rs1_data_sig		:	std_logic_vector(63 downto 0);
	signal EX_rs2_data_sig		:	std_logic_vector(63 downto 0);
	signal EX_rs3_data_sig		:	std_logic_vector(63 downto 0);
	signal EX_rd_data_sig		:	std_logic_vector(63 downto 0);	
	signal EX_data_out_sig		:	std_logic_vector(63 downto 0);
	signal EX_write_en_sig		:	std_logic;	
	
	
begin 
	clock: process 	
	begin  
		
		while true loop 
			clk <= '0';		 
			wait for clk_period/2;
			clk <= '1';
			wait for clk_period/2; 		
		end loop;  		
	end process;
	
	tb	: process begin
		wait for clk_period/2;
		wr_en <= '1';							 
		
		buffer_in0  <= X"BFFFCF";
		buffer_in1  <= X"0081EC";
		buffer_in2  <= X"04318C";
		buffer_in3  <= X"DFFFEF";
		buffer_in4  <= X"04B1E1";
		buffer_in5  <= X"0131E1";
		buffer_in6  <= X"01B1E1";
		buffer_in7  <= X"0201E1";
		buffer_in8  <= X"0281E1";
		buffer_in9  <= X"80002D";
		buffer_in10 <= X"0335E1";
		buffer_in11 <= X"03B5E1";
		buffer_in12 <= X"053C2C";
		buffer_in13 <= X"05BD8D";
		buffer_in14 <= X"900001";
		buffer_in15 <= X"AFFFC1";
		buffer_in16 <= X"A001ED";
		buffer_in17 <= X"06358D";
		buffer_in18 <= X"06B1ED";
		buffer_in19 <= X"955542";
		buffer_in20 <= X"CAAAA2";
		buffer_in21 <= X"070842";
		buffer_in22 <= X"0785ED";
		buffer_in23 <= X"07BC2D";
		buffer_in24 <= X"A4000E";
		buffer_in25 <= X"5739C2";
		buffer_in26 <= X"5738C2";
		buffer_in27 <= X"7738C2";
		buffer_in28 <= X"C000A6";
		buffer_in29 <= X"8000C6";
		buffer_in30 <= X"4318C2";
		buffer_in31 <= X"6318C2"; 	  
		
	 	wait for clk_period/2;
	end process;
	
	output_to_file: process																			
		file output_file						:	text;	 
	begin				
		file_open(output_file, "C:\Users\rrubio04\OneDrive\Fall 2017\ESE 345\ESE_345_PROJECT\CellLiteUnit\Output\results.txt", write_mode);
			print(output_file,"==================================================================================================================");
			print(output_file," ESE 345 Multimedia Unit");
			print(output_file," Reynerio Rubio and John Kim");
			print(output_file,"    -output values from each stage of this three stage pipeline");
			print(output_file,"         -Instruction Fetch                                                                                       ");
			print(output_file,"         -Instruction Decode                                                                                      ");
			print(output_file,"         -Execution/Write Back                                                                                    ");
			print(output_file,"==================================================================================================================");
			print(output_file, "");	
			print(output_file, "");		
		--if(rising_edge(clk)) then
		for this_cycle in 0 to 50 loop
			wait for clk_period;			 
		
			
			print(output_file,"Cycle "& str(this_cycle));
			print(output_file, "--------------------INSTRUCTION FETCH STAGE---------------------"); 
			print(output_file, "instruction:   " & str(IF_buffer_sig));	
			print(output_file, "");	
			
			print(output_file, "--------------------INSTRUCTION DECODE STAGE--------------------"); 
			print(output_file, "instruction: " & str(ID_instruction_sig));  
			if ID_instruction_sig(23 downto 22) = "10" or ID_instruction_sig(23 downto 22) = "11" then	 
				print(output_file, "    instruction: li ");
				print(output_file, "    field:       " & str(ID_instruction_sig(22 downto 21)));		   
				print(output_file, "    immediate:   " & str(ID_instruction_sig(20 downto 5))); 
				print(output_file, "    rd:          " & str(ID_instruction_sig(4 downto 0)));	   
			elsif ID_instruction_sig(23 downto 22) = "01" then	
				
				if (ID_instruction_sig(21 downto 20) = "00") then
					print(output_file, " instruction: MA low");	
				elsif (ID_instruction_sig(21 downto 20) = "01") then
					print(output_file, " instruction: MA high"); 	  
				elsif (ID_instruction_sig(21 downto 20) = "10") then
					print(output_file, " instruction: MS low");
				elsif (ID_instruction_sig(21 downto 20) = "11") then
					print(output_file, " instruction: MS high"); 	  
				else 
					print(output_file, " instruction: UNKNOWN"); 	 
				end if;					
				print(output_file, "    rs3(" & str(ID_rs3_addr_sig)  & ") = " & str(ID_rs3_data_sig) ); 		 	 
				print(output_file, "    rs2(" & str(ID_rs2_addr_sig)  & ") = " & str(ID_rs2_data_sig) );
				print(output_file, "    rs1(" & str(ID_rs1_addr_sig)  & ") = " & str(ID_rs1_data_sig) );
				print(output_file, "    rd (" & str(ID_read_rd_addr_sig)  & ") = " & str(ID_rd_data_sig) );
			elsif ID_instruction_sig(23 downto 22) = "00" then				   
				
					case ID_instruction_sig(18 downto 15) is	
						when "0000" => print(output_file, " instruction: nop    ");
						when "0001" => print(output_file, " instruction: bcw    ");
						when "0010" => print(output_file, " instruction: and    ");
						when "0011" => print(output_file, " instruction: or     ");
						when "0100" => print(output_file, " instruction: popcnth"); 
						when "0101" => print(output_file, " instruction: clz    ");
						when "0110" => print(output_file, " instruction: rot    ");
						when "0111" => print(output_file, " instruction: shlhi  "); 
						
						when "1000" => print(output_file, " instruction: a      ");
						when "1001" => print(output_file, " instruction: sfw    ");
						when "1010" => print(output_file, " instruction: ah     ");
						when "1011" => print(output_file, " instruction: sfh    ");
						when "1100" => print(output_file, " instruction: ahs    ");
						when "1101" => print(output_file, " instruction: sfhs   ");
						when "1110" => print(output_file, " instruction: mpyu   ");
						when "1111" => print(output_file, " instruction: absdb  ");
						when others => print(output_file, " instruction: UNKNOWN ");
					end case;	 		 	 	
					
					print(output_file, "    rs2(" & str(ID_rs2_addr_sig)  & ") = " & str(ID_rs2_data_sig) );
					print(output_file, "    rs1(" & str(ID_rs1_addr_sig)  & ") = " & str(ID_rs1_data_sig) );
					print(output_file, "    rd (" & str(ID_read_rd_addr_sig)  & ") = " & str(ID_rd_data_sig) );	
			else				
								 
					print(output_file, " instruction: UNKNOWN ");
			end if;
			
			print(output_file, "");					  
			print(output_file, "--------------------EXECUTE/WRITE BACK STAGE--------------------");
			if EX_instruction_sig(23 downto 22) = "10" or EX_instruction_sig(23 downto 22) = "11" then	 
				print(output_file, "    instruction: li ");
				print(output_file, "    field:        " & str(EX_instruction_sig(22 downto 21)));		   
				print(output_file, "    immediate:    " & str(EX_instruction_sig(20 downto 5)));
				print(output_file, "    rd:           " & str(EX_instruction_sig(4 downto 0)));	 
									
				print(output_file, "");	 
			elsif EX_instruction_sig(23 downto 22) = "01" then	
				
				if (EX_instruction_sig(21 downto 20) = "00") then
					print(output_file, " instruction: MA low");	
				elsif (EX_instruction_sig(21 downto 20) = "01") then
					print(output_file, " instruction: MA high"); 	  
				elsif (EX_instruction_sig(21 downto 20) = "10") then
					print(output_file, " instruction: MS low");
				elsif (EX_instruction_sig(21 downto 20) = "11") then
					print(output_file, " instruction: MS high"); 	  
				else 
					print(output_file, " instruction: UNKNOWN"); 	 
				end if;					
				print(output_file, "    rs3        = " & str(EX_rs3_data_sig) ); 		 	 
				print(output_file, "    rs2        = " & str(EX_rs2_data_sig) );
				print(output_file, "    rs1        = " & str(EX_rs1_data_sig) );
				print(output_file, "    rd         = " & str(EX_rd_data_sig) );
				
				print(output_file, "");	
						  	   
				
				print(output_file, "");						
			elsif EX_instruction_sig(23 downto 22) = "00" then				   
				
					case EX_instruction_sig(18 downto 15) is	
						when "0000" => print(output_file, " instruction: nop    ");
						when "0001" => print(output_file, " instruction: bcw    ");
						when "0010" => print(output_file, " instruction: and    ");
						when "0011" => print(output_file, " instruction: or     ");
						when "0100" => print(output_file, " instruction: popcnth"); 
						when "0101" => print(output_file, " instruction: clz    ");
						when "0110" => print(output_file, " instruction: rot    ");
						when "0111" => print(output_file, " instruction: shlhi  "); 
						
						when "1000" => print(output_file, " instruction: a      ");
						when "1001" => print(output_file, " instruction: sfw    ");
						when "1010" => print(output_file, " instruction: ah     ");
						when "1011" => print(output_file, " instruction: sfh    ");
						when "1100" => print(output_file, " instruction: ahs    ");
						when "1101" => print(output_file, " instruction: sfhs   ");
						when "1110" => print(output_file, " instruction: mpyu   ");
						when "1111" => print(output_file, " instruction: absdb  ");
						when others => print(output_file, " instruction: UNKNOWN ");
					end case;												   		 	 
					print(output_file, "    rs2        = " & str(EX_rs2_data_sig) );
					print(output_file, "    rs1        = " & str(EX_rs1_data_sig) );
					print(output_file, "    rd         = " & str(EX_rd_data_sig) );		  
												 
					print(output_file, "");	
			else				
								 
					print(output_file, " instruction: UNKNOWN ");	  
					print(output_file, "");		
			end if;	  
			print(output_file, "    alu_out    = " & str(EX_data_out_sig) );
			print(output_file, "    write_en   = " & str(EX_write_en_sig) );	
			print(output_file,"==================================================================================================================");
		end loop;	
		
		file_close(output_file);	
		wait;
		
		end process;   
		
--	output_register_file: process																			
--		file output_register_file				:	text;	 	
--			
--		begin				
--		file_open(output_file, "C:\Users\rrubio04\OneDrive\Fall 2017\ESE 345\ESE_345_PROJECT\CellLiteUnit\Output\results_register_file.txt", write_mode);
--
--		for this_cycle in 0 to 50 loop
--			wait for 35*clk_period;	
--			
--			
--			
--		end loop 	 	
--	end process	


	DUT : entity Multimedia port map (		
		buffer_in0	=>	buffer_in0, 
		buffer_in1	=>	buffer_in1,
		buffer_in2	=>	buffer_in2, 
		buffer_in3	=>	buffer_in3, 
		buffer_in4	=>	buffer_in4,
		buffer_in5	=>	buffer_in5,
		buffer_in6	=>	buffer_in6, 
		buffer_in7	=>	buffer_in7,
		buffer_in8	=>	buffer_in8,
		buffer_in9	=>	buffer_in9,
		buffer_in10	=>	buffer_in10,
		buffer_in11	=>	buffer_in11, 
		buffer_in12	=>	buffer_in12, 				  
		buffer_in13	=>	buffer_in13,
		buffer_in14	=>	buffer_in14,
		buffer_in15 =>	buffer_in15,
		buffer_in16	=>	buffer_in16,
		buffer_in17	=>	buffer_in17, 
		buffer_in18	=>	buffer_in18, 				  
		buffer_in19	=>	buffer_in19,
		buffer_in20	=>	buffer_in20,
		buffer_in21	=> 	buffer_in21,
		buffer_in22 =>	buffer_in22, 
		buffer_in23 =>	buffer_in23,   
		buffer_in24	=>	buffer_in24,
		buffer_in25	=>	buffer_in25, 
		buffer_in26	=>	buffer_in26, 				  
		buffer_in27	=>	buffer_in27,
		buffer_in28	=>	buffer_in28,
		buffer_in29 =>	buffer_in29, 
		buffer_in30 =>	buffer_in30, 
		buffer_in31 =>	buffer_in31,
		clk 		=> clk, 
		reset 		=> reset, 
		wr_en 		=> wr_en,
		IF_instruction => IF_buffer_sig,
		
		ID_instruction	=> ID_instruction_sig,	
		ID_rd_data_out		=> ID_rd_data_sig,
		ID_read_rd_addr		=> ID_read_rd_addr_sig,	  
		ID_rs1_data_out		=> ID_rs1_data_sig,
		ID_rs2_data_out		=> ID_rs2_data_sig,
		ID_rs3_data_out		=> ID_rs3_data_sig,	
		ID_rs1_addr			=> ID_rs1_addr_sig,
		ID_rs2_addr			=> ID_rs2_addr_sig,
		ID_rs3_addr		=> ID_rs3_addr_sig,
		ID_write_rd_addr	=> ID_write_rd_addr_sig,
		
		
		EX_write_en		=> EX_write_en_sig,
		EX_data_out 	=> EX_data_out_sig,
		EX_instruction => EX_instruction_sig,
		EX_rd_data_out	=> EX_rd_data_sig,
		EX_rs1_data_out => EX_rs1_data_sig,
		EX_rs2_data_out => EX_rs2_data_sig,
		EX_rs3_data_out => EX_rs3_data_sig		   
	); 	  				   
end tb;
