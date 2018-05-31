library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity mux_sum is
    Port ( dispo30 : in  STD_LOGIC_VECTOR (31 downto 0);
           dispo22 : in  STD_LOGIC_VECTOR (31 downto 0);
           pc4 : in  STD_LOGIC_VECTOR (31 downto 0);
           alu_op : in  STD_LOGIC_VECTOR (31 downto 0);
           pc_source : in  STD_LOGIC_VECTOR (1 downto 0);
           mux_out : out  STD_LOGIC_VECTOR (31 downto 0));
end mux_sum;

architecture Behavioral of mux_sum is

begin
process(dispo30,dispo22,pc4,alu_op,pc_source)
begin
	   case (pc_source) is 
      when "00" =>
         mux_out<=dispo30;
      when "01" =>
         mux_out<=dispo22;
      when "10" =>
         mux_out<=pc4;
      when "11" =>
         mux_out<=alu_op;
      when others =>
         mux_out<="00000000000000000000000000000000";
   end case;

end process;

end Behavioral;

