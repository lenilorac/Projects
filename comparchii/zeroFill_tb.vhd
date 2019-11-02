----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Divine Mbunga
-- 
-- Create Date:    02:52:20 05/04/2019 
-- Design Name: 
-- Module Name:   ZeroFill Test Bench- Behavioral 
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
 
ENTITY zeroFill_tb IS
END zeroFill_tb;
 
ARCHITECTURE behavior OF zeroFill_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT zeroFill
    PORT(
         SB_in : IN  std_logic_vector(2 downto 0);
         zero_fill_out : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal SB_in : std_logic_vector(2 downto 0) := (others => '0');

 	--Outputs
   signal zero_fill_out : std_logic_vector(15 downto 0);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: zeroFill PORT MAP (
          SB_in => SB_in,
          zero_fill_out => zero_fill_out
        );

   -- Stimulus process
   stim_proc: process
   begin	
		wait for 10ns;
		SB_in <= "110";
		wait;
   end process;

END;