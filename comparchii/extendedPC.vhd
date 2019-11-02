----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Divine Mbunga
-- 
-- Create Date:    02:52:20 05/04/2019 
-- Design Name: 
-- Module Name:   Extended Program Counter- Behavioral 
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

entity extendedPC is
	Port(	SR_SB : in STD_LOGIC_VECTOR(5 downto 0);
			extendedPC : out STD_LOGIC_VECTOR(15 downto 0)
			);
end extendedPC;

architecture Behavioral of extendedPC is
	signal extended_signal : STD_LOGIC_VECTOR(15 downto 0);
begin
	extended_signal(5 downto 0) <= SR_SB;
	extended_signal(15 downto 6) <= "0000000000" when SR_SB(5) = '0' else "1111111111";
	extendedPC <= extended_signal;

end Behavioral;
