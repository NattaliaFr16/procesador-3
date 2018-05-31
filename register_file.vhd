----------------------------------------------------------------------------------
-- Company: 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity register_file is
    Port ( rs1_in : in  STD_LOGIC_VECTOR (5 downto 0);
           rs2_in : in  STD_LOGIC_VECTOR (5 downto 0);
           rd_in : in  STD_LOGIC_VECTOR (5 downto 0);
           crd : out STD_LOGIC_VECTOR (31 downto 0);
			  dwr_alu : in  STD_LOGIC_VECTOR (31 downto 0);
           rst : in  STD_LOGIC;
			  we: in std_logic;
           crs1_alu : out  STD_LOGIC_VECTOR (31 downto 0);
           crs2_mux : out  STD_LOGIC_VECTOR (31 downto 0)
			  
			  );
end register_file;

architecture Behavioral of register_file is

type ram_type is array (39 downto 0) of std_logic_vector (31 downto 0);
signal ram :  ram_type := (others => "00000000000000000000000000000000");


begin
	process (rs1_in, rs2_in, rd_in, dwr_alu, rst)
		begin
		
			ram(0) <= "00000000000000000000000000000000";
			crs1_alu <= ram (conv_integer (rs1_in));
			crs2_mux <= ram (conv_integer (rs2_in));
			
			if (rd_in /= "00000" and we= '1') then 
				ram(conv_integer(rd_in)) <= dwr_alu;
				
		end if;
			crd <= RAM(conv_integer(rd_in));
		
			if rst = '1' then 
				ram <= (others => "00000000000000000000000000000000");  
			
			end if;
			
	end process;		
	
end Behavioral;

