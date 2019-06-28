-------------------------------------------------------------------------------
--
-- Title       : LSRUnit
-- Design      : MultimediaUnit
-- Author      : Reynerio Rubio and John Kim
-- Company     : Stony Brook University
--
-------------------------------------------------------------------------------
--
-- File        : c:\Users\rrubio04\OneDrive\Fall 2017\ESE 345\ESE_345_PROJECT\CellLiteUnit\src\LSRUnit.vhd
-- Generated   : Sat Dec  2 13:13:35 2017
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
use ieee.numeric_std.all;

entity LSRUnit is			 
	
	port(									   
		rs1_data_in			:	in std_logic_vector(63 downto 0); 
		rs2_data_in			:	in std_logic_vector(63 downto 0); 	
		instruction_type	:	in std_logic_vector(1 downto 0);  	--instruction[23:22]
		opcode 				:	in std_logic_vector(6 downto 0);	--instruction[21:15] 								
		data_out 			:	out std_logic_vector(63 downto 0)	 	  
	);
	
	
	
end LSRUnit;
									
architecture behavior of LSRUnit is	 	

	
	signal data_out_sig	:	std_logic_vector(63 downto 0);	
	--signal opcode			:	std_logic_vector(6 downto 0);
begin
	process(rs1_data_in, rs2_data_in, instruction_type, opcode) 
		
		variable temp_data	: 	integer; 
		variable counter_0	:	integer; 
		variable counter_1	:	integer; 
		variable counter_2	: 	integer;
		variable counter_3	:	integer; 	  
	
	begin
		if instruction_type = "00" then	
			
			--opcode <= instruction_in(21 downto 15);	 
			
			--nop
			if (opcode(3 downto 0) = "0000") then
				data_out_sig <= (others => '0');	
				
			--bcw
			elsif (opcode(3 downto 0) = "0001") then
				data_out_sig <= std_logic_vector'(rs1_data_in(31 downto 0) & rs1_data_in(31 downto 0));
			--and
			elsif (opcode(3 downto 0) = "0010") then
				data_out_sig <= std_logic_vector(rs1_data_in and rs2_data_in);	
				
			--or
			elsif (opcode(3 downto 0) = "0011") then
				data_out_sig <= std_logic_vector(rs1_data_in or rs2_data_in);
				
			--popcnth
			elsif (opcode(3 downto 0) = "0100") then	   
				
				-- COUNT ONES IN THE FIRST HALFWORD
				counter_0 := 0;	
				for i in 63 downto 48 loop 
					if rs1_data_in(i) = '1' then
						counter_0 := counter_0 + 1;
					end if;	 
				end loop;
				
				-- COUNT ONES IN THE SECOND HALFWORD
				counter_1 := 0;
				for i in 47 downto 32 loop
					if rs1_data_in(i) = '1' then 
						counter_1 := counter_1 + 1;
					end if;	 
				end loop;	   
				
				-- COUNT ONES IN THE THIRD HALFWORD
				counter_2 := 0;							  					   
				for i in 31 downto 16 loop
					if rs1_data_in(i) = '1' then		
						counter_2 := counter_2 + 1;
					end if;	 
				end loop; 	
				
				-- COUNT ONES IN THE FOURTH HALFWORD
				counter_3 := 0;
				for i in 15 downto 0 loop 
					if rs1_data_in(i) = '1' then	
						counter_3 := counter_3 + 1;
					end if;	 
				end loop;
				
				data_out_sig <= std_logic_vector(to_unsigned(counter_0,16)) & 
									std_logic_vector(to_unsigned(counter_1,16)) & 
									std_logic_vector(to_unsigned(counter_2,16)) & 
									std_logic_vector(to_unsigned(counter_3,16));
			--clz
			elsif (opcode(3 downto 0) = "0101") then
				
				-- COUNT LEADING ZEROS IN THE FIRST WORD
				counter_0 := 0;
				for i in 63 downto 32 loop	 
					if rs1_data_in(i) = '0' then	  
						counter_0 := counter_0 + 1;
					else
						exit;					
					end if;	 
				end loop;	
				
				data_out_sig(63 downto 32) <= std_logic_vector(to_unsigned(counter_0, 32)); 	 
				
				-- COUNT LEADING ZEROS IN THE SECOND WORD
				counter_1 := 0;
				for i in 31 downto 0 loop 	   
					if rs1_data_in(i) = '0' then	 
						counter_1 := counter_1 + 1;
					else
						exit;					
					end if; 
				end loop;	
				data_out_sig(31 downto 0) <= std_logic_vector(to_unsigned(counter_1, 32));
			
			--rot
			elsif (opcode(3 downto 0) = "0110") then	
				--temp_data (rs2(5 downto 0)) holds the amount of times to shift rs1 by
				temp_data := to_integer(unsigned(rs2_data_in(5 downto 0)));
				data_out_sig <= std_logic_vector(rotate_right(unsigned(rs1_data_in),(temp_data)));
				
			--shlhi
			elsif (opcode(3 downto 0) = "0111") then
				data_out_sig(63 downto 48)	<= std_logic_vector(shift_left(unsigned(rs1_data_in(63 downto 48)),(to_integer(unsigned(rs2_data_in(3 downto 0)))))); 
				data_out_sig(47 downto 32)	<= std_logic_vector(shift_left(unsigned(rs1_data_in(47 downto 32)),(to_integer(unsigned(rs2_data_in(3 downto 0))))));
				data_out_sig(31 downto 16)	<= std_logic_vector(shift_left(unsigned(rs1_data_in(31 downto 16)),(to_integer(unsigned(rs2_data_in(3 downto 0))))));
				data_out_sig(15 downto 0)	<= std_logic_vector(shift_left(unsigned(rs1_data_in( 15 downto 0)),(to_integer(unsigned(rs2_data_in(3 downto 0))))));
			end if;
		end if;
	end process;
	
	data_out <=	data_out_sig;

end behavior;
