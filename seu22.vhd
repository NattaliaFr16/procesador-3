library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;



entity seu22 is
    Port ( disp22 : in  STD_LOGIC_VECTOR (21 downto 0);
           seu_out : out  STD_LOGIC_VECTOR (31 downto 0));
end seu22;

architecture Behavioral of seu22 is

begin
	
	seu_out<=std_logic_vector(resize(signed(disp22), seu_out'length));

end Behavioral;

