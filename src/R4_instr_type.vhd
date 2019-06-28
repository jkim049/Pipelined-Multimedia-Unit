-------------------------------------------------------------------------------
--
-- Title       : R4_instr_type
-- Design      : MultimediaUnit
-- Author      : Reynerio Rubio and John Kim
-- Company     : Stony Brook University
--
-------------------------------------------------------------------------------
--
-- File        : c:\Users\rrubio04\OneDrive\Fall 2017\ESE 345\ESE_345_PROJECT\CellLiteUnit\src\R4_instr_type.vhd
-- Generated   : Mon Dec  4 20:15:51 2017
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
--{entity {R4_instr_type} architecture {behavioral}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use ieee.numeric_std.all;



entity R4_instr_type is
	port(
		a					:	in std_logic_vector(63 downto 0); 
		b					:	in std_logic_vector(63 downto 0);
		c					:	in std_logic_vector(63 downto 0); 	
		instruction_type	:	in std_logic_vector(1 downto 0);  	--instruction[23:22]
		ma_ms_l_h 			:	in std_logic_vector(1 downto 0);	--instruction[21:20] 								
		data_out 			:	out std_logic_vector(63 downto 0)	 
	);
end R4_instr_type;

--}} End of automatically maintained section

architecture behavioral of R4_instr_type is	
										
begin

	process(a, b, c, instruction_type, ma_ms_l_h)
	
	constant SIGNED_32_BIT_WORD_MAX	: 	integer	:= 2147483647;
	constant SIGNED_32_BIT_WORD_MIN	: 	integer := -2147483648;
	constant SIGNED_16_BIT_WORD_MAX	: 	integer := 32767;
	constant SIGNED_16_BIT_WORD_MIN	: 	integer := -32768; 
	
	begin	  
		if instruction_type = "01" then	
			
			
			-- Signed integer multiple-add low with saturation	
			--    Multiply low 16-bit-fields of each 32-bit field of registers rs3 and rs2, 
			--    then add 32-bit products to 32-bit fields of register rs1, 
			--    and save result in register rd
			if ma_ms_l_h = "00" then 	 
				
				if(SIGNED_32_BIT_WORD_MIN > to_integer(signed(c(15 downto 0))) * to_integer(signed(b(15 downto 0))) + to_integer(signed(a(31 downto 0))) ) then
					data_out(31 downto 0) <= X"80000000";
				elsif( SIGNED_32_BIT_WORD_MAX < to_integer(signed(c(15 downto 0))) * to_integer(signed(b(15 downto 0))) + to_integer(signed(a(31 downto 0))) ) then
					data_out(31 downto 0) <= X"7FFFFFFF";
				else
					data_out(31 downto 0) <= std_logic_vector(to_signed( to_integer(signed(c(15 downto 0))) * to_integer(signed(b(15 downto 0))) + to_integer(signed(a(31 downto 0))),32));
				end if;	  
			    
				if(SIGNED_32_BIT_WORD_MIN > to_integer(signed(c(47 downto 32))) * to_integer(signed(b(47 downto 32))) + to_integer(signed(a(63 downto 31))) ) then
					data_out(63 downto 32) <= X"80000000";
				elsif( SIGNED_32_BIT_WORD_MAX < to_integer(signed(c(47 downto 32))) * to_integer(signed(b(47 downto 32))) + to_integer(signed(a(63 downto 31))) ) then
					data_out(63 downto 32) <= X"7FFFFFFF";
				else
					data_out(63 downto 32) <= std_logic_vector(to_signed( to_integer(signed(c(47 downto 32))) * to_integer(signed(b(47 downto 32))) + to_integer(signed(a(63 downto 31))),32));
				end if;	  

			-- Signed integer multiple-add high with saturation
			--    Multiply high 16-bit-fields of each 32-bit field of registers rs3 and rs2, 
			--    then add 32-bit products to 32-bit fields of register rs1, 
			--    and save result in register rd.
			elsif ma_ms_l_h = "01" then	   
				
				
				if(SIGNED_32_BIT_WORD_MIN > to_integer(signed(c(31 downto 16))) * to_integer(signed(b(31 downto 16))) + to_integer(signed(a(31 downto 0))) ) then
					data_out(31 downto 0) <= X"80000000";
				elsif( SIGNED_32_BIT_WORD_MAX < to_integer(signed(c(31 downto 16))) * to_integer(signed(b(31 downto 0))) + to_integer(signed(a(31 downto 0))) ) then
					data_out(31 downto 0) <= X"7FFFFFFF";
				else
					data_out(31 downto 0) <= std_logic_vector(to_signed( to_integer(signed(c(31 downto 16))) * to_integer(signed(b(31 downto 16))) + to_integer(signed(a(31 downto 0))),32));
				end if;	  
	
				if(SIGNED_32_BIT_WORD_MIN > to_integer(signed(c(63 downto 48))) * to_integer(signed(b(63 downto 48))) + to_integer(signed(a(63 downto 32))) ) then
					data_out(63 downto 32) <= X"80000000";
				elsif( SIGNED_32_BIT_WORD_MAX < to_integer(signed(c(63 downto 48))) * to_integer(signed(b(63 downto 48))) + to_integer(signed(a(63 downto 32))) ) then
					data_out(63 downto 32) <= X"7FFFFFFF";
				else
					data_out(63 downto 32) <= std_logic_vector(to_signed( to_integer(signed(c(63 downto 48))) * to_integer(signed(b(63 downto 48))) + to_integer(signed(a(63 downto 32))),32));
				end if;	  
				
			-- Signed integer multiple-subtract low with saturation
			--    Multiply low 16-bit-fields of each 32-bit field of registers rs3 and rs2, 
			--    then subtract 32-bit products from 32-bit fields of register rs1,
			--    and save result in register rd.
			elsif ma_ms_l_h = "10" then	

				if(SIGNED_32_BIT_WORD_MIN > to_integer(signed(a(31 downto 0))) - to_integer(signed(c(15 downto 0))) * to_integer(signed(b(15 downto 0))) ) then
					data_out(31 downto 0) <= X"80000000";
				elsif( SIGNED_32_BIT_WORD_MAX < to_integer(signed(a(31 downto 0))) - to_integer(signed(c(15 downto 0))) * to_integer(signed(b(15 downto 0))) ) then
					data_out(31 downto 0) <= X"7FFFFFFF";
				else
					data_out(31 downto 0) <= std_logic_vector(to_signed(to_integer(signed(a(31 downto 0))) - to_integer(signed(c(15 downto 0))) * to_integer(signed(b(15 downto 0)))  ,32));
				end if;	  
			    
				if(SIGNED_32_BIT_WORD_MIN > to_integer(signed(a(63 downto 32))) - to_integer(signed(c(47 downto 32))) * to_integer(signed(b(47 downto 32))) ) then
					data_out(63 downto 32) <= X"80000000";
				elsif( SIGNED_32_BIT_WORD_MAX < to_integer(signed(a(63 downto 32))) - to_integer(signed(c(47 downto 32))) * to_integer(signed(b(47 downto 32))) ) then
					data_out(63 downto 32) <= X"7FFFFFFF";
				else
					data_out(63 downto 32) <= std_logic_vector(to_signed(to_integer(signed(a(63 downto 32))) - to_integer(signed(c(47 downto 32))) * to_integer(signed(b(47 downto 32)))  ,32));
				end if;	  
				
			-- Signed integer multiple-subtract high with saturation
			--    Multiply high 16-bit-fields of each 32-bit field of registers rs3 and rs2,
			--    then subtract 32-bit products from 32-bit fields of register rs1, 
			--    and save result in register rd.
			elsif ma_ms_l_h = "11" then	

				if(SIGNED_32_BIT_WORD_MIN > to_integer(signed(a(31 downto 0))) - to_integer(signed(c(31 downto 16))) * to_integer(signed(b(31 downto 16))) ) then
					data_out(31 downto 0) <= X"80000000";
				elsif( SIGNED_32_BIT_WORD_MAX < to_integer(signed(a(31 downto 0))) - to_integer(signed(c(31 downto 16))) * to_integer(signed(b(31 downto 16))) ) then
					data_out(31 downto 0) <= X"7FFFFFFF";
				else
					data_out(31 downto 0) <= std_logic_vector(to_signed(to_integer(signed(a(31 downto 0))) - to_integer(signed(c(31 downto 16))) * to_integer(signed(b(31 downto 16)))  ,32));
				end if;	  
			    
				if(SIGNED_32_BIT_WORD_MIN > to_integer(signed(a(63 downto 32))) - to_integer(signed(c(63 downto 48))) * to_integer(signed(b(63 downto 48))) ) then
					data_out(63 downto 32) <= X"80000000";
				elsif( SIGNED_32_BIT_WORD_MAX < to_integer(signed(a(63 downto 32))) - to_integer(signed(c(63 downto 48))) * to_integer(signed(b(63 downto 48))) ) then
					data_out(63 downto 32) <= X"7FFFFFFF";
				else
					data_out(63 downto 32) <= std_logic_vector(to_signed(to_integer(signed(a(63 downto 32))) - to_integer(signed(c(63 downto 48))) * to_integer(signed(b(63 downto 48)))  ,32));
				end if;	  
			  
			end if;
		end if;
	end process;
end behavioral;
