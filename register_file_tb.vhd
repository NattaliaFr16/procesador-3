--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Cbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY register_file_tb IS
END register_file_tb;
 
ARCHITECTURE behavior OF register_file_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT register_file
    PORT(
         rs1_in : IN  std_logic_vector(4 downto 0);
         rs2_in : IN  std_logic_vector(4 downto 0);
         rd_in : IN  std_logic_vector(4 downto 0);
         dwr_alu : IN  std_logic_vector(31 downto 0);
         rst : IN  std_logic;
         crs1_alu : OUT  std_logic_vector(31 downto 0);
         crs2_mux : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal rs1_in : std_logic_vector(4 downto 0) := (others => '0');
   signal rs2_in : std_logic_vector(4 downto 0) := (others => '0');
   signal rd_in : std_logic_vector(4 downto 0) := (others => '0');
   signal dwr_alu : std_logic_vector(31 downto 0) := (others => '0');
   signal rst : std_logic := '0';

 	--Outputs
   signal crs1_alu : std_logic_vector(31 downto 0);
   signal crs2_mux : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   --constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: register_file PORT MAP (
          rs1_in => rs1_in,
          rs2_in => rs2_in,
          rd_in => rd_in,
          dwr_alu => dwr_alu,
          rst => rst,
          crs1_alu => crs1_alu,
          crs2_mux => crs2_mux
        );

   -- Clock process definitions
  
 

   -- Stimulus process
   stim_proc: process
   begin		
		rs1_in <= "00000";
		rs2_in <= "00001";
		rd_in <= "10000";
		rst <= '0';
		dwr_alu <= "00000000000000000000000000000001";
		wait for 100 ns;
		rst <= '1';
		wait for 100 ns;
		rst <= '0';
		rs1_in <= "00000";
		rs2_in <= "00001";
		rd_in <= "11000";
		wait for 20 ns;
		rd_in <= "00000";
      wait;
   end process;

END;
