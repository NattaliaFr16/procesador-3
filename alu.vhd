----------------------------------------------------------------------------------

--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.all;
use ieee.std_logic_unsigned.all;


entity alu is
    Port ( mux_in : in  STD_LOGIC_VECTOR (31 downto 0);	--op2
           crs1 : in  STD_LOGIC_VECTOR (31 downto 0);		--op1
           uc_in : in  STD_LOGIC_VECTOR (5 downto 0);   --op code
           alu_result : out  STD_LOGIC_VECTOR (31 downto 0);
			  c : in  STD_LOGIC
			  );
end alu;

architecture Behavioral of alu is

begin
process (mux_in, crs1, uc_in ,c)

begin
		--report"uc_in: "&integer'image(conv_integer(uc_in));
		case uc_in is 
			
			--add
			when "000000" => alu_result <= std_logic_vector ( signed(crs1) + signed (mux_in));
			
			--sub 
			when "000100" => alu_result <= std_logic_vector ( signed(crs1) - signed (mux_in));
			
			--and
			when "000001" => alu_result <= crs1 and mux_in;
			
			--nand
			when "000101" => alu_result <= crs1 and not mux_in;
			
			--or
			when "000010" => alu_result <= crs1 or mux_in;
			
			--nor
			when "000110" => alu_result <= crs1 or not mux_in;
			
			--xor
			when "000011" => alu_result <= crs1 xor mux_in;
			
			--xnor
			when "000111" => alu_result <= crs1 xnor mux_in;
			
			
			
			
			
			when "010000" => -- addcc
				alu_result <= std_logic_vector(SIGNED(crs1) + SIGNED(mux_in));
			when "001000" => 
				alu_result <= std_logic_vector((crs1) + (mux_in)+c); 					  --ADDX
			when "001100" => 
				alu_result <= std_logic_vector((crs1) - (mux_in)-c); 					  --SUBx
			when "011000" => 
				alu_result <= std_logic_vector((crs1) + (mux_in)+c); 					  --ADDxcc
			when "011100" => 
				alu_result <= std_logic_vector((crs1) - (mux_in)-c); 					  --SUBxcc
			when "010100"=>   
				alu_result <= std_logic_vector(SIGNED(crs1) - SIGNED(mux_in)); --subcc

			when "010001" => -- andcc
				alu_result <= crs1 AND mux_in ;
			when "010101" => -- andncc
				alu_result <= crs1 and NOT mux_in;
			when "010010" => -- orcc
				alu_result <= crs1 or mux_in;
			when "010110" => -- orncc
				alu_result <= crs1 or NOT mux_in;
			when "010011" => -- xorcc
				alu_result <= crs1 xor mux_in ;
			when "010111" => -- xnorcc
				alu_result <= crs1 xnor mux_in;

			when "100101" => -- sll
				alu_result <= to_stdlogicvector((to_bitvector(crs1)) sll conv_integer (mux_in));
				--aluresult <= crs1 + CRS2mux  ;
			when "100110" => -- srl
				alu_result <= to_stdlogicvector((to_bitvector(crs1)) srl conv_integer (mux_in));
				--aluresult <= crs1 + CRS2mux  ;
			when "111100" =>                                                 --save
				alu_result <= crs1 + mux_in;
						
			when "111101" =>                                                 --restore
				alu_result <= crs1 + mux_in;	
			
			
			
			when others => alu_result <= "11111111111111111111111111111111"; -- cuando no se cumplen los casos anteriores, me devuelve -1
			
		end case;
end process;
	

end Behavioral;

