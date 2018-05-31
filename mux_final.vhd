----------------------------------------------------------------------------------

----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity mux_final is
    Port ( datatomem : in  STD_LOGIC_VECTOR (31 downto 0);
           alu_out : in  STD_LOGIC_VECTOR (31 downto 0);
           pc : in  STD_LOGIC_VECTOR (31 downto 0);
           rfsource : in  STD_LOGIC_VECTOR (1 downto 0);
           datatoreg : out  STD_LOGIC_VECTOR (31 downto 0));
end mux_final;

architecture Behavioral of mux_final is

begin

process(datatomem,alu_out,rfsource,pc)
begin
	if rfsource="00" then datatoreg<=datatomem;
	elsif rfsource="01" then datatoreg<=alu_out;
	elsif rfsource="10" then datatoreg<=pc;
	end if;

end process;

end Behavioral;

