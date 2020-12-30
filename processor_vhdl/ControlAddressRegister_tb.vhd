----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Divine Mbunga
-- 
-- Create Date:    16:17:30 04/04/2019 
-- Design Name: 
-- Module Name:   Control Address Register Test Bench- Behavioral 
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
 
ENTITY ControlAddressRegister_tb IS
END ControlAddressRegister_tb;
 
ARCHITECTURE behavior OF ControlAddressRegister_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ControlAddressRegister
    PORT(
         car_in : IN  std_logic_vector(7 downto 0);
         s_car : IN  std_logic;
         reset : IN  std_logic;
         car_out : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal car_in : std_logic_vector(7 downto 0) := (others => '0');
   signal s_car : std_logic := '0';
   signal reset : std_logic := '0';

 	--Outputs
   signal car_out : std_logic_vector(7 downto 0);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ControlAddressRegister PORT MAP (
          car_in => car_in,
          s_car => s_car,
          reset => reset,
          car_out => car_out
        );
		  
   -- Stimulus process
   stim_proc: process
   begin		
		wait for 5ns;
		reset <= '1';
		
		wait for 30ns;
		reset <= '0';
		
		wait for 30ns;
		car_in <= x"01";
		
		wait for 30ns;
		car_in <= x"A1";
		s_car <= '1';

      wait;
   end process;

END;