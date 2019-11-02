----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Divine Mbunga
-- 
-- Create Date:    17:20:20 04/04/2019 
-- Design Name: 
-- Module Name:   Memory Test Bench- Behavioral 
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
 
ENTITY Memory_tb IS
END Memory_tb;
 
ARCHITECTURE behavior OF Memory_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Memory
    PORT(
         address_mem : IN  std_logic_vector(15 downto 0);
         write_data : IN  std_logic_vector(15 downto 0);
         mem_write : IN  std_logic;
         read_data : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal address_mem : std_logic_vector(15 downto 0) := (others => '0');
   signal write_data : std_logic_vector(15 downto 0) := (others => '0');
   signal mem_write : std_logic := '0';

 	--Outputs
   signal read_data : std_logic_vector(15 downto 0);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Memory PORT MAP (
          address_mem => address_mem,
          write_data => write_data,
          mem_write => mem_write,
          read_data => read_data
        );

   -- Stimulus process
   stim_proc: process
   begin		
		wait for 10ns;
		address_mem <= x"0000";
		
		wait for 10ns;
		address_mem <= x"0001";
		
		wait for 10ns;
		address_mem <= x"0006";
		
		wait for 10ns;
		address_mem <= x"0007";

      wait;
   end process;

END;