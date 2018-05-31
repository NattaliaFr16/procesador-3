--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY union_tb IS
END union_tb;
 
ARCHITECTURE behavior OF union_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT union
    PORT(
         unrst : IN  std_logic;
         unclk : IN  std_logic;
         unout : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal unrst : std_logic := '0';
   signal unclk : std_logic := '0';

 	--Outputs
   signal unout : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant unclk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: union PORT MAP (
          unrst => unrst,
          unclk => unclk,
          unout => unout
        );

   -- Clock process definitions
   unclk_process :process
   begin
		unclk <= '0';
		wait for unclk_period/2;
		unclk <= '1';
		wait for unclk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin			
		

      -- insert stimulus here 

      wait;
   end process;

END;
