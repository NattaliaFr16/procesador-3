
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using

entity PSR is
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           ncwp : in  STD_LOGIC_VECTOR (4 downto 0);
           nzvc : in  STD_LOGIC_VECTOR (3 downto 0);
           cwp : out  STD_LOGIC_VECTOR (4 downto 0);
           c : out  STD_LOGIC);
end PSR;

architecture Behavioral of PSR is

signal pcr_register: std_logic_vector(31 downto 0):= "00000000000000000000000000000000";


begin

process (clk, rst, ncwp, nzvc)
begin 
	if (rst = '1') then 
			pcr_register <= "00000000000000000000000000000000";
			--cwp <= "00000";
	elsif (clk'event and clk = '1') then  
			pcr_register(23 downto 20) <= nzvc;			--se le asignan los bits del icc a la señal nzvc
			pcr_register(4 downto 0) <= ncwp;
	end if;	
			


end process;
c <= pcr_register(20);
cwp <= pcr_register (4 downto 0);


end Behavioral;

