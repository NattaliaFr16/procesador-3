
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity mux is
    Port ( crs2 : in  STD_LOGIC_VECTOR (31 downto 0); --A
           seu32 : in  STD_LOGIC_VECTOR (31 downto 0); --B
           i : in  STD_LOGIC;										--sel
           mux_out : out  STD_LOGIC_VECTOR (31 downto 0));	--salida
end mux;

architecture Behavioral of mux is

begin

process (crs2, seu32, i)
	
begin 
		if (i = '0') then mux_out<= crs2;
		elsif (i = '1') then mux_out <= seu32;
		end if;
		
end process;


end Behavioral;

