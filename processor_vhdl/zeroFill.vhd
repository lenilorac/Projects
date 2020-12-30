----------------------------------------------------------------------------------
-- Company: 
-- Engineer:  Divine Mbunga
-- 
-- Create Date:    02:52:20 05/04/2019 
-- Design Name: 
-- Module Name:   ZeroFill - Behavioral 
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
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity zeroFill is
	Port(	SB_in : in STD_LOGIC_VECTOR(2 downto 0);
			zero_fill_out : out STD_LOGIC_VECTOR(15 downto 0)
			);
end zeroFill;

architecture Behavioral of zeroFill is
	signal ZeroFill : STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
	--signal zero_fill_out : STD_LOGIC_VECTOR(15 downto 0):= (others => '0');
begin
	--ZeroFill(2 downto 0) <= SB_in;
	--ZeroFill(15 downto 3) <= "0000000000000";
	zero_fill_out(2 downto 0) <= SB_in;
	zero_fill_out(15 downto 3) <= "0000000000000";
end Behavioral;