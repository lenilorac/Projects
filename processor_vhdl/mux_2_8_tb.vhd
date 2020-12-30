----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Divine Mbunga
-- 
-- Create Date:    02:52:20 05/04/2019 
-- Design Name: 
-- Module Name:   2x8 Multiplexer Test Bench- Behavioral 
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
 
ENTITY mux_2_8_tb IS
END mux_2_8_tb;
 
ARCHITECTURE behavior OF mux_2_8_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT mux_2_8
    PORT(
         In0_NA : IN  std_logic_vector(7 downto 0);
         In1_opcode : IN  std_logic_vector(7 downto 0);
         S_mc : IN  std_logic;
         out_car : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal In0_NA : std_logic_vector(7 downto 0) := (others => '0');
   signal In1_opcode : std_logic_vector(7 downto 0) := (others => '0');
   signal S_mc : std_logic := '0';

 	--Outputs
   signal out_car : std_logic_vector(7 downto 0);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: mux_2_8 PORT MAP (
          In0_NA => In0_NA,
          In1_opcode => In1_opcode,
          S_mc => S_mc,
          out_car => out_car
        ); 

   -- Stimulus process
   stim_proc: process
   begin		
		In0_NA <= x"FF";
		In1_opcode <= x"AA";
		
		wait for 20ns;
		S_mc <= '1';
		
      wait;
   end process;

END;