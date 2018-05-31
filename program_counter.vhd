
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity program_counter is
    Port ( pcadder : in  STD_LOGIC_VECTOR (31 downto 0);
           rst : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           salida : out  STD_LOGIC_VECTOR (31 downto 0));
end program_counter;

architecture Behavioral of program_counter is

signal hold : std_logic_vector (31 downto 0) := x"00000000";  


begin

process (pcadder,clk,hold,rst)						--siempre va con lo que trabajo,o sea las entradas
	begin 
	if ( rst = '0') then 								--si rst = 0 hace la operacion 
		if (clk'event and clk = '1') then         -- cuando hay un evento de reloj y esta en 1
			hold <= pcadder;								--almacena resultado de la suma y la guarda
		end if;
	
	else 														--si rst = 1  
		hold <= "00000000000000000000000000000000";								--llena de ceros
	end if;
	
	
	salida <= hold;										--entrega de resultados


end process;
end Behavioral;

