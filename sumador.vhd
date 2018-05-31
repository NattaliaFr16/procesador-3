-------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;   --Libreria para sumar directamente los bits



entity sumador is
    Port ( A : in  STD_LOGIC_VECTOR (31 downto 0);
           B : in  STD_LOGIC_VECTOR (31 downto 0);
           C : out  STD_LOGIC_VECTOR (31 downto 0));
end sumador;

architecture Behavioral of sumador is

begin

process (a,b) is
	begin 
	c <= std_logic_vector(signed (a) + signed (b)); 	--donde se hiciera a + b solo se estaria sumando un bitt  


end process;

end Behavioral;

