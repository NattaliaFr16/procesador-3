
--------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL; 
use IEEE.STD_LOGIC_ARITH.ALL;	
 
ENTITY alu_tb IS
END alu_tb;
 
ARCHITECTURE behavior OF alu_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT alu
    PORT(
         mux_in : IN  std_logic_vector(31 downto 0); --op2
         crs1 : IN  std_logic_vector(31 downto 0); --op1
         uc_in : IN  std_logic_vector(5 downto 0);	--op code
         alu_result : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal mux_in : std_logic_vector(31 downto 0) := (others => '0');
   signal crs1 : std_logic_vector(31 downto 0) := (others => '0');
   signal uc_in : std_logic_vector(5 downto 0) := (others => '0');

 	--Outputs
   signal alu_result : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   --constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: alu PORT MAP (
          mux_in => mux_in,
          crs1 => crs1,
          uc_in => uc_in,
          alu_result => alu_result
        );

   -- Clock process definitions


   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      --wait for 100 ns;	

      

      -- insert stimulus here 


		crs1<=conv_std_logic_vector(10,32);
      mux_in<=conv_std_logic_vector(-5,32);
		uc_in<="000000";
		wait for 100 ns;
		uc_in<="000100";
		wait for 100 ns;
		

      wait;
   end process;

END;
