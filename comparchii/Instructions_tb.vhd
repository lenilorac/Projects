----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Divine Mbunga
-- 
-- Create Date:    17:10:08 04/04/2019 
-- Design Name: 
-- Module Name:   Instructions Test Bench- Behavioral 
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
 
ENTITY Instructions_tb IS
END Instructions_tb;
 
ARCHITECTURE behavior OF Instructions_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Instructions
    PORT(
         IR_in : IN  std_logic_vector(15 downto 0);
         IL_in : IN  std_logic;
         Opcode : OUT  std_logic_vector(6 downto 0);
         DR_out : OUT  std_logic_vector(2 downto 0);
         SA_out : OUT  std_logic_vector(2 downto 0);
         SB_out : OUT  std_logic_vector(2 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal IR_in : std_logic_vector(15 downto 0) := (others => '0');
   signal IL_in : std_logic := '0';

 	--Outputs
   signal Opcode : std_logic_vector(6 downto 0);
   signal DR_out : std_logic_vector(2 downto 0);
   signal SA_out : std_logic_vector(2 downto 0);
   signal SB_out : std_logic_vector(2 downto 0);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Instructions PORT MAP (
          IR_in => IR_in,
          IL_in => IL_in,
          Opcode => Opcode,
          DR_out => DR_out,
          SA_out => SA_out,
          SB_out => SB_out
        );
		  
   -- Stimulus process
   stim_proc: process
   begin		
		wait for 10ns;
		IR_in <= "1111111000001010";
		
		wait for 5ns;
		IL_in <= '1';
		
		wait for 10ns;
		IR_in <= "0000000110110000";
		IL_in <= '0';
		
		wait for 5ns;
		IL_in <= '1';

      wait;
   end process;

END;