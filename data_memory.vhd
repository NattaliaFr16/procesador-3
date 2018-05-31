library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;



entity dataMemory is
	Port ( 
		clk 	: in  STD_LOGIC;
		rst : in  STD_LOGIC;
		crd	: in  STD_LOGIC_VECTOR (31 downto 0);
		re 	: in  STD_LOGIC;
		we 	: in  STD_LOGIC;
		aluo 	: in  STD_LOGIC_VECTOR (31 downto 0);				
		datato 	: out  STD_LOGIC_VECTOR (31 downto 0)
	);
end dataMemory;

architecture Behavioral of dataMemory is

	type ram_type is array (39 downto 0) of std_logic_vector (31 downto 0);
	signal ram : ram_type := (others => x"00000000");
	
begin

	process(clk,aluo,we,re,crd,rst)
	begin
		if(rising_edge(clk)) then
			if(re = '1') then
				if(rst = '1') then
					datato <= (others => '0');
					ram <= (others => x"00000000");
					
				elsif(we = '0') then
					datato <= ram(conv_integer(crd(5 downto 0)));
					
				else
					ram(conv_integer(crd(5 downto 0))) <= aluo;
					
				end if;
			end if;
		end if;
		
	end process;
	
end Behavioral;
