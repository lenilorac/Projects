----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Divine Mbunga
-- 
-- Create Date:    02:52:20 05/04/2019 
-- Design Name: 
-- Module Name:   Extended Program Counter Test Bench- Behavioral 
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
 
ENTITY extendedPC_tb IS
END extendedPC_tb;
 
ARCHITECTURE behavior OF extendedPC_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT extendedPC
    PORT(
         SR_SB : IN  std_logic_vector(5 downto 0);
         extendedPC : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal SR_SB : std_logic_vector(5 downto 0) := (others => '0');

 	--Outputs
   signal extended_PC : std_logic_vector(15 downto 0);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: extendedPC PORT MAP (
          SR_SB => SR_SB,
          extendedPC => extended_PC
        );

   -- Stimulus process
   stim_proc: process
   begin		
		wait for 10ns;
		SR_SB <= "010110";
		
		wait for 10ns;
		SR_SB <= "110110";
		
      wait;
   end process;

END;