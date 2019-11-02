----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Divine Mbunga
-- 
-- Create Date:    16:55:20 04/04/2019 
-- Design Name: 
-- Module Name:   Program Counter Test Bench- Behavioral 
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
 
ENTITY pc_tb IS
END pc_tb;
 
ARCHITECTURE behavior OF pc_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT pc
    PORT(
         PC_module_in : IN  std_logic_vector(15 downto 0);
         PL_module_in : IN  std_logic;
         PI_module_in : IN  std_logic;
         reset : IN  std_logic;
         PC_module_out : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal PC_module_in : std_logic_vector(15 downto 0) := (others => '0');
   signal PL_module_in : std_logic := '0';
   signal PI_module_in : std_logic := '0';
   signal reset : std_logic := '0';

 	--Outputs
   signal PC_module_out : std_logic_vector(15 downto 0);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: pc PORT MAP (
          PC_module_in => PC_module_in,
          PL_module_in => PL_module_in,
          PI_module_in => PI_module_in,
          reset => reset,
          PC_module_out => PC_module_out
        );

   -- Stimulus process
   stim_proc: process
   begin		
		wait for 5ns;
		reset <= '1';
		PC_module_in <= x"0000";
		
		wait for 5ns;
		reset <= '0';
		
		wait for 5ns;
		PI_module_in <= '1';
		PC_module_in <= x"0002";
		
		wait for 20ns;
		PI_module_in <= '0';
		PL_module_in <= '1';
		PC_module_in <= x"000F";

      wait;
   end process;

END;