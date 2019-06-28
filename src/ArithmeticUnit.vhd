-------------------------------------------------------------------------------
--
-- Title       : ArithmeticUnit
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
use ieee.numeric_std.all; 
--use ieee.std_logic_unsigned.all;
--use ieee.std_logic_arith.all;

entity ArithmeticUnit is
	port(
		a					:	in std_logic_vector(63 downto 0); 
		b					:	in std_logic_vector(63 downto 0); 	
		instruction_type	:	in std_logic_vector(1 downto 0);  	--instruction[23:22]
		opcode 				:	in std_logic_vector(6 downto 0);	--instruction[21:15] 								
		data_out 			:	out std_logic_vector(63 downto 0)	 
	);
end ArithmeticUnit;

--}} End of automatically maintained section

architecture mixed of ArithmeticUnit is
signal a_halfword_sig_0	:	std_logic_vector(16 downto 0);
signal a_halfword_sig_1	:	std_logic_vector(16 downto 0); 
signal a_halfword_sig_2	:	std_logic_vector(16 downto 0);
signal a_halfword_sig_3	:	std_logic_vector(16 downto 0);

signal b_halfword_sig_0	:	std_logic_vector(16 downto 0);
signal b_halfword_sig_1	:	std_logic_vector(16 downto 0); 
signal b_halfword_sig_2	:	std_logic_vector(16 downto 0);
signal b_halfword_sig_3	:	std_logic_vector(16 downto 0); 

signal a_word_sig_0	:	std_logic_vector(32 downto 0);
signal a_word_sig_1	:	std_logic_vector(32 downto 0); 
signal b_word_sig_0	:	std_logic_vector(32 downto 0);
signal b_word_sig_1	:	std_logic_vector(32 downto 0);
begin		 
	process(opcode, instruction_type) 
	constant SIGNED_32_BIT_WORD_MAX	: 	integer	:= 2147483647;
	constant SIGNED_32_BIT_WORD_MIN	: 	integer := -2147483648;
	constant SIGNED_16_BIT_WORD_MAX	: 	integer := 32767;
	constant SIGNED_16_BIT_WORD_MIN	: 	integer := -32768;
	begin	  
		if instruction_type = "00" then	  
			
			
			
			-- a: add word: packed 32-bit unsigned add of the contents of registers rs1 and rs2 
			-- (Comments: 2 separate 32-bit values in each 64-bit register)
			if opcode(3 downto 0) = "1000" then
				--data_out(31 downto 0)  <= std_logic_vector(to_unsigned( to_integer(unsigned(a(31 downto 0))) + to_integer(unsigned(b(32 downto 0))),32));
				data_out(31 downto 0)  <= std_logic_vector(unsigned(a(31 downto 0)) + unsigned(b(31 downto 0)));
				--data_out(63 downto 32) <= std_logic_vector(to_unsigned( to_integer(unsigned(a(63 downto 32))) + to_integer(unsigned(b(63 downto 32))),32));
				data_out(63 downto 32) <= std_logic_vector(unsigned(a(63 downto 32)) + unsigned(b(63 downto 32)));
			-- sfw: subtract from word: (packed) 32-bit unsigned subtract of the contents of 
			-- registers rs1 and rs2 (Comments: 2 separate 32-bit values in each 64-bit register)
			elsif opcode(3 downto 0) = "1001" then
				if (to_integer(unsigned(a(31 downto 0)))) < (to_integer(unsigned(b(31 downto 0)))) then
					data_out(31 downto 0) <= X"00000000";
				else
					data_out(31 downto 0) <= std_logic_vector(to_unsigned(to_integer(unsigned(a(31 downto 0))) - to_integer(unsigned(b(31 downto 0))),32));
				end if;
				if (to_integer(unsigned(a(63 downto 32)))) < (to_integer(unsigned(b(63 downto 32)))) then
					data_out(63 downto 32) <= X"00000000";
				else
					data_out(63 downto 32) <= std_logic_vector(to_unsigned(to_integer(unsigned(a(63 downto 32))) - to_integer(unsigned(b(63 downto 32))),32));
				end if;
				
			-- ah: add halfword : (packed) (16-bit) halfword unsigned add of the contents of registers rs1 and rs2 
			-- (Comments: 4 separate 16-bit values in each 64-bit register)
			elsif opcode(3 downto 0) = "1010" then
				data_out(15 downto 0) <= std_logic_vector(to_unsigned( to_integer(unsigned(a(15 downto 0))) + to_integer(unsigned(b(15 downto 0))),16));
				data_out(31 downto 16) <= std_logic_vector(to_unsigned( to_integer(unsigned(a(31 downto 16))) + to_integer(unsigned(b(31 downto 16))),16));
				data_out(47 downto 32) <= std_logic_vector(to_unsigned( to_integer(unsigned(a(47 downto 32))) + to_integer(unsigned(b(47 downto 32))),16));
				data_out(63 downto 48) <= std_logic_vector(to_unsigned( to_integer(unsigned(a(63 downto 48))) + to_integer(unsigned(b(63 downto 48))),16));
				
			-- sfh: subtract from halfword: (packed) (16-bit) 
			-- halfword unsigned subtract of the contents of registers rs1 and rs2
			elsif opcode(3 downto 0) = "1011" then
				if (to_integer(unsigned(a(15 downto 0)))) < (to_integer(unsigned(b(15 downto 0)))) then
					data_out(15 downto 0) <= X"0000";
				else
					data_out(15 downto 0) <= std_logic_vector(to_unsigned( to_integer(unsigned(a(15 downto 0))) - to_integer(unsigned(b(15 downto 0))),16));
				end if;		
				
				if (to_integer(unsigned(a(31 downto 16)))) < (to_integer(unsigned(b(31 downto 16)))) then
					data_out(31 downto 16) <= X"0000";
				else
					data_out(31 downto 16) <= std_logic_vector(to_unsigned( to_integer(unsigned(a(31 downto 16))) - to_integer(unsigned(b(31 downto 16))),16));
				end if;
				
				if (to_integer(unsigned(a(47 downto 32)))) < (to_integer(unsigned(b(47 downto 32)))) then
					data_out(47 downto 32) <= X"0000";
				else
					data_out(47 downto 32) <= std_logic_vector(to_unsigned( to_integer(unsigned(a(47 downto 32))) - to_integer(unsigned(b(47 downto 32))),16));
				end if;
				
				if (to_integer(unsigned(a(63 downto 48)))) < (to_integer(unsigned(b(63 downto 48)))) then
					data_out(63 downto 48) <= X"0000";
				else
					data_out(63 downto 48) <= std_logic_vector(to_unsigned( to_integer(unsigned(a(63 downto 48))) - to_integer(unsigned(b(63 downto 48))),16));
				end if;
				
				
			
				
			-- ahs: add halfword saturated: (packed) (16-bit) 
			-- halfword signed add with saturation of the contents of registers rs1 and rs2
			elsif opcode(3 downto 0) = "1100" then
				if(SIGNED_16_BIT_WORD_MIN > to_integer(signed(a(15 downto 0))) + to_integer(signed(b(15 downto 0))) ) then
					data_out(15 downto 0) <= X"8000";
				elsif( SIGNED_16_BIT_WORD_MAX < to_integer(signed(a(15 downto 0))) + to_integer(signed(b(15 downto 0))) ) then
					data_out(15 downto 0) <= X"7FFF";
				else
					data_out(15 downto 0) <= std_logic_vector(to_signed( to_integer(signed(a(15 downto 0))) + to_integer(signed(b(15 downto 0))),16));
				end if;	  
				
				
				
				if( SIGNED_16_BIT_WORD_MIN > to_integer(signed(a(31 downto 16))) + to_integer(signed(b(31 downto 16))) ) then
					data_out(31 downto 16) <= X"8000";
				elsif( SIGNED_16_BIT_WORD_MAX < to_integer(signed(a(31 downto 16))) + to_integer(signed(b(31 downto 16))) ) then
					data_out(31 downto 16) <= X"7FFF";
				else
					data_out(31 downto 16) <= std_logic_vector(to_signed( to_integer(signed(a(31 downto 16))) + to_integer(signed(b(31 downto 16))),16));
				end if;	  
					 
				
				
				if( SIGNED_16_BIT_WORD_MIN > to_integer(signed(a(47 downto 32))) + to_integer(signed(b(47 downto 32))) ) then
					data_out(47 downto 32) <= X"8000";
				elsif( SIGNED_16_BIT_WORD_MAX < to_integer(signed(a(47 downto 32))) + to_integer(signed(b(47 downto 32))) ) then
					data_out(47 downto 32) <= X"7FFF";
				else
					data_out(47 downto 32) <= std_logic_vector(to_signed( to_integer(signed(a(47 downto 32))) + to_integer(signed(b(47 downto 32))),16));
				end if;	  	   
				
				
				
				if( SIGNED_16_BIT_WORD_MIN > to_integer(signed(a(63 downto 48))) + to_integer(signed(b(63 downto 48))) ) then
					data_out(63 downto 48) <= X"8000";
				elsif( SIGNED_16_BIT_WORD_MAX < to_integer(signed(a(63 downto 48))) + to_integer(signed(b(63 downto 48))) ) then
					data_out(63 downto 48) <= X"7FFF";
				else
					data_out(63 downto 48) <= std_logic_vector(to_signed( to_integer(signed(a(63 downto 48))) + to_integer(signed(b(63 downto 48))),16));
				end if;	  
				
			-- sfhs: subtract from halfword saturated: (packed) (16-bit) 
			-- signed subtract with saturation of the contents of registers rs1 and rs2
			elsif opcode(3 downto 0) = "1101" then 	  
				
			   if(a(15) = '1' or b(15) ='1') then
					if( SIGNED_16_BIT_WORD_MIN > to_integer(signed(a(15 downto 0))) - to_integer(signed(b(15 downto 0))) ) then
						data_out(15 downto 0) <= X"8000";
					elsif( SIGNED_16_BIT_WORD_MAX < to_integer(signed(a(15 downto 0))) - to_integer(signed(b(15 downto 0))) ) then
						data_out(15 downto 0) <= X"7FFF";
					else
						data_out(15 downto 0) <= std_logic_vector(to_signed( to_integer(signed(a(15 downto 0))) - to_integer(signed(b(15 downto 0))),16));
					end if;	  
				else  
						data_out(15 downto 0) <= std_logic_vector(to_signed( to_integer(signed(a(15 downto 0))) - to_integer(signed(b(15 downto 0))),16));
				end if;
				
				if(a(31) = '1' or b(31) ='1') then
					if( SIGNED_16_BIT_WORD_MIN > to_integer(signed(a(31 downto 16))) - to_integer(signed(b(31 downto 16))) ) then
						data_out(31 downto 16) <= X"8000";
					elsif( SIGNED_16_BIT_WORD_MAX < to_integer(signed(a(31 downto 16))) - to_integer(signed(b(31 downto 16))) ) then
						data_out(31 downto 16) <= X"7FFF";
					else
						data_out(31 downto 16) <= std_logic_vector(to_signed( to_integer(signed(a(31 downto 16))) - to_integer(signed(b(31 downto 16))),16));
					end if;	  
				else  
						data_out(31 downto 16) <= std_logic_vector(to_signed( to_integer(signed(a(31 downto 16))) - to_integer(signed(b(31 downto 16))),16));
				end if;		 
				
				if(a(47) = '1' or b(47) ='1') then
					if( SIGNED_16_BIT_WORD_MIN > to_integer(signed(a(47 downto 32))) - to_integer(signed(b(47 downto 32))) ) then
						data_out(47 downto 32) <= X"8000";
					elsif( SIGNED_16_BIT_WORD_MAX < to_integer(signed(a(47 downto 32))) - to_integer(signed(b(47 downto 32))) ) then
						data_out(47 downto 32) <= X"7FFF";
					else
						data_out(47 downto 32) <= std_logic_vector(to_signed( to_integer(signed(a(47 downto 32))) - to_integer(signed(b(47 downto 32))),16));
					end if;	  	   
				else  
						data_out(47 downto 32) <= std_logic_vector(to_signed( to_integer(signed(a(47 downto 32))) - to_integer(signed(b(47 downto 32))),16));
				end if;
				
				if(a(63) = '1' or b(63) ='1') then
					if( SIGNED_16_BIT_WORD_MIN > to_integer(signed(a(63 downto 48))) - to_integer(signed(b(63 downto 48))) ) then
						data_out(63 downto 48) <= X"8000";
					elsif( SIGNED_16_BIT_WORD_MAX < to_integer(signed(a(63 downto 48))) - to_integer(signed(b(63 downto 48))) ) then
						data_out(63 downto 48) <= X"7FFF";
					else
						data_out(63 downto 48) <= std_logic_vector(to_signed( to_integer(signed(a(63 downto 48))) - to_integer(signed(b(63 downto 48))),16));
					end if;	  
				else  
						data_out(63 downto 48) <= std_logic_vector(to_signed( to_integer(signed(a(63 downto 48))) - to_integer(signed(b(63 downto 48))),16));
				end if;
			
			-- mpyu: multiply unsigned: the 16 rightmost bits of each of the two 32-bit slots in registers rs1 are multiplied 
			-- by the 16 rightmost bits of the corresponding 32-bit slots in register rs2, treating both operands as unsigned.
			-- The two 32-bit products are placed into the corresponding slots of register rd. 
			-- (Comments: 2 separate 32-bit values in each 64-bit register)
			elsif opcode(3 downto 0) = "1110" then
				--a_halfword_sig <= a(15 downto 0);
				--b_halfword_sig <= b(15 downto 0);	 
				--data_out(31 downto 0) <= std_logic_vector(unsigned(a_halfword_sig) * unsigned(b_halfword_sig));
				--data_out(31 downto 0) <= std_logic_vector(unsigned(a(31 downto 0)) + unsigned(b(31 downto 0)));
				
				--data_out(31 downto 0) <= X"FFFFFFFF";
				--data_out(63 downto 32)<= std_logic_vector(unsigned(a(47 downto 32))*unsigned(b(47 downto 32))); 
				data_out(31 downto 0) <= std_logic_vector(to_unsigned( to_integer(unsigned(a(15 downto 0))) * to_integer(unsigned(b(15 downto 0))),32));
				data_out(63 downto 32) <= std_logic_vector(to_unsigned( to_integer(unsigned(a(47 downto 32))) * to_integer(unsigned(b(47 downto 32))),32));
				  
			-- absdb: absolute difference of bytes: the contents of each of the eight byte slots in register rs2 is subtracted 
			-- from the contents of the corresponding byte slot in register rs1. The absolute value of each of the results is 
			-- placed into the corresponding byte slot in register rd. 
			-- (Comments: 8 separate 8-bit values in each 64-bit register)
			elsif opcode(3 downto 0) = "1111" then
				
				-- (7 to 0) byte
				if (to_integer(unsigned(b(7 downto 0))) < to_integer(unsigned(a(7 downto 0)))) then
					data_out(7 downto 0) <= 
						std_logic_vector(to_unsigned(to_integer(unsigned(a(7 downto 0))) - 
						to_integer(unsigned(b(7 downto 0))),8));
				else
					data_out(7 downto 0) <= 
						std_logic_vector(to_unsigned(to_integer(unsigned(b(7 downto 0))) - 
						to_integer(unsigned(a(7 downto 0))),8));
				end if;
				
				-- (15 to 8) byte
				if to_integer(unsigned(b(15 downto 8))) < to_integer(unsigned(a(15 downto 8))) then
					data_out(15 downto 8) <= 
						std_logic_vector(to_unsigned(to_integer(unsigned(a(15 downto 8))) -
						to_integer(unsigned(b(15 downto 8))),8));
				else
					data_out(15 downto 8) <= 
						std_logic_vector(to_unsigned(to_integer(unsigned(b(15 downto 8))) -
						to_integer(unsigned(a(15 downto 8))),8));
				end if;
				
				-- (23 to 16) byte
				if to_integer(unsigned(b(23 downto 16))) < to_integer(unsigned(a(23 downto 16))) then
					data_out(23 downto 16) <= 
						std_logic_vector(to_unsigned(to_integer(unsigned(a(23 downto 16))) -
						to_integer(unsigned(b(23 downto 16))),8));
				else
					data_out(23 downto 16) <= 
						std_logic_vector(to_unsigned(to_integer(unsigned(b(23 downto 16))) -
						to_integer(unsigned(a(23 downto 16))),8));
				end if;
				
				-- (31 to 24) byte
				if to_integer(unsigned(b(31 downto 24))) < to_integer(unsigned(a(31 downto 24))) then
					data_out(31 downto 24) <= 
						std_logic_vector(to_unsigned(to_integer(unsigned(a(31 downto 24))) -
						to_integer(unsigned(b(31 downto 24))),8));
				else
					data_out(31 downto 24) <= 
						std_logic_vector(to_unsigned(to_integer(unsigned(b(31 downto 24))) - 
						to_integer(unsigned(a(31 downto 24))), 8));
				end if;
				
				-- (39 to 32) byte
				if to_integer(unsigned(b(39 downto 32))) < to_integer(unsigned(a(39 downto 32))) then
					data_out(39 downto 32) <= 
						std_logic_vector(to_unsigned(to_integer(unsigned(a(39 downto 32))) -
						to_integer(unsigned(b(39 downto 32))),8));
				else
					data_out(39 downto 32) <= 
						std_logic_vector(to_unsigned(to_integer(unsigned(b(39 downto 32))) -
						to_integer(unsigned(a(39 downto 32))),8));
				end if;
				
				-- (47 to 40) byte
				if to_integer(unsigned(b(47 downto 40))) < to_integer(unsigned(a(47 downto 40))) then
					data_out(47 downto 40) <= 
						std_logic_vector(to_unsigned(to_integer(unsigned(a(47 downto 40))) -
						to_integer(unsigned(b(47 downto 40))),8));
				else
					data_out(47 downto 40) <= 
						std_logic_vector(to_unsigned(to_integer(unsigned(b(47 downto 40))) -
						to_integer(unsigned(a(47 downto 40))),8));
				end if;	   
				
				
				-- (55 to 48) byte
				if to_integer(unsigned(b(55 downto 48))) < to_integer(unsigned(a(55 downto 48))) then
					data_out(55 downto 48) <= 
						std_logic_vector(to_unsigned(to_integer(unsigned(a(55 downto 48))) -
						to_integer(unsigned(b(55 downto 48))),8));
				else
					data_out(55 downto 48) <= 
						std_logic_vector(to_unsigned(to_integer(unsigned(b(55 downto 48))) -
						to_integer(unsigned(a(55 downto 48))),8));
				end if;									 
				
				-- (63 to 56) byte
				if to_integer(unsigned(b(63 downto 56))) < to_integer(unsigned(a(63 downto 56))) then
					data_out(63 downto 56) <= 
						std_logic_vector(to_unsigned(to_integer(unsigned(a(63 downto 56))) -
						to_integer(unsigned(b(63 downto 56))),8));
				else
					data_out(63 downto 56) <= 
						std_logic_vector(to_unsigned(to_integer(unsigned(b(63 downto 56))) -
						to_integer(unsigned(a(63 downto 56))),8));
				end if;
			end if;	   
		end if;
	end process;
end mixed;

