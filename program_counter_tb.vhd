

--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY program_counter_tb IS
END program_counter_tb;
 
ARCHITECTURE behavior OF program_counter_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT program_counter
    PORT(
         pcadder : IN  std_logic_vector(31 downto 0); --data in
         rst : IN  std_logic;
         clk : IN  std_logic;
         salida : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal pcadder : std_logic_vector(31 downto 0) := (others => '0');
   signal rst : std_logic := '0';
   signal clk : std_logic := '0';

 	--Outputs
   signal salida : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: program_counter PORT MAP (
          pcadder => pcadder,
          rst => rst,
          clk => clk,
          salida => salida
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
	
		rst <= '0';
		pcadder <= "00000000000000000000000000000001";
      wait for 100 ns;	
		rst <='1';
		wait for 100 ns;
		rst <='0';
		pcadder <= "00000000000000000000000000001101";
		wait for 100 ns;
		
      -- insert stimulus here 

      wait;
   end process;

END;
