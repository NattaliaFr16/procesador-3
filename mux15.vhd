library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
--use ieee.numeric_std.all;

entity mux15 is
    Port ( rd_wm : in  STD_LOGIC_VECTOR (5 downto 0);
           wm_15 : in  STD_LOGIC_VECTOR (5 downto 0);
           RFdest : in  STD_LOGIC;
           nRD : out  STD_LOGIC_VECTOR (5 downto 0));
end mux15;

architecture Behavioral of mux15 is

begin

process (rd_wm,wm_15, RFdest)

	begin
		if RFdest='0' then nRD<=rd_wm;
		elsif RFdest='1' then nRD<=wm_15;
		end if;
	end process;

end Behavioral;

