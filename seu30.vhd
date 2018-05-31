
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity seu30 is
    Port ( disp30 : in  STD_LOGIC_VECTOR (29 downto 0);
           seu30_out : out  STD_LOGIC_VECTOR (31 downto 0));
end seu30;

architecture Behavioral of seu30 is

begin

	seu30_out<=std_logic_vector(resize(signed(disp30), seu30_out'length));

end Behavioral;

