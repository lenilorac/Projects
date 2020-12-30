----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Divine Mbunga
-- 
-- Create Date:    02:52:20 05/04/2019 
-- Design Name: 
-- Module Name:    4x9 Decoder Test Bench- Behavioral 
-- Project Name:   project-2-Processor
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY deocder_4_9_tb IS
END deocder_4_9_tb;
 
ARCHITECTURE behavior OF deocder_4_9_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT decoder_4_9
    PORT(
         A0 : IN  std_logic;
         A1 : IN  std_logic;
         A2 : IN  std_logic;
         A3 : IN  std_logic;
         Q0 : OUT  std_logic;
         Q1 : OUT  std_logic;
         Q2 : OUT  std_logic;
         Q3 : OUT  std_logic;
         Q4 : OUT  std_logic;
         Q5 : OUT  std_logic;
         Q6 : OUT  std_logic;
         Q7 : OUT  std_logic;
         Q8 : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal A0 : std_logic := '0';
   signal A1 : std_logic := '0';
   signal A2 : std_logic := '0';
   signal A3 : std_logic := '0';

 	--Outputs
   signal Q0 : std_logic;
   signal Q1 : std_logic;
   signal Q2 : std_logic;
   signal Q3 : std_logic;
   signal Q4 : std_logic;
   signal Q5 : std_logic;
   signal Q6 : std_logic;
   signal Q7 : std_logic;
   signal Q8 : std_logic;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: decoder_4_9 PORT MAP (
          A0 => A0,
          A1 => A1,
          A2 => A2,
          A3 => A3,
          Q0 => Q0,
          Q1 => Q1,
          Q2 => Q2,
          Q3 => Q3,
          Q4 => Q4,
          Q5 => Q5,
          Q6 => Q6,
          Q7 => Q7,
          Q8 => Q8
        );

   -- Stimulus process
   stim_proc: process
   begin		
		wait for 5ns;
		A0 <= '0';
		A1 <= '0';
		A2 <= '0';
		A3 <= '0';
		
		wait for 5ns;
		A0 <= '1';
		A1 <= '0';
		A2 <= '0';
		A3 <= '0';
		
		wait for 5ns;
		A0 <= '0';
		A1 <= '1';
		A2 <= '0';
		A3 <= '0';
		
		wait for 5ns;
		A0 <= '1';
		A1 <= '1';
		A2 <= '0';
		A3 <= '0';
		
		wait for 5ns;
		A0 <= '0';
		A1 <= '0';
		A2 <= '1';
		A3 <= '0';
		
		wait for 5ns;
		A0 <= '1';
		A1 <= '0';
		A2 <= '1';
		A3 <= '0';
		
		wait for 5ns;
		A0 <= '0';
		A1 <= '1';
		A2 <= '1';
		A3 <= '0';
		
		wait for 5ns;
		A0 <= '1';
		A1 <= '1';
		A2 <= '1';
		A3 <= '0';
		
		wait for 5ns;
		A3 <= '1';
		
		wait for 5ns;
		A0 <= '0';
		A1 <= '0';
		A2 <= '0';
		
		wait for 5ns;
		A0 <= '1';
		A1 <= '0';
		A2 <= '0';
		
		wait for 5ns;
		A0 <= '0';
		A1 <= '1';
		A2 <= '0';
   end process;

END;