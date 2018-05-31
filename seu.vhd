----------------------------------------------------------------------------------

----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;


entity seu is
    Port ( simm13 : in  STD_LOGIC_VECTOR (12 downto 0);
           seu_out : out  STD_LOGIC_VECTOR (31 downto 0));
end seu;

architecture Behavioral of seu is

begin

seu_out<= std_logic_vector(resize(signed(simm13),seu_out'length));



end Behavioral;

