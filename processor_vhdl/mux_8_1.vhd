----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Divine Mbunga
-- 
-- Create Date:    02:52:20 05/04/2019 
-- Design Name: 
-- Module Name:   8X1 Multiplexer- Behavioral 
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

entity mux_8_1 is
	Port(	In_zero, In_one, In_n, In_z, In_c, In_v, In_not_c, In_not_z : in STD_LOGIC;
			S_ms : in STD_LOGIC_VECTOR(2 downto 0);
			out_s_car : out STD_LOGIC
			);
end mux_8_1;

architecture Behavioral of mux_8_1 is

begin
	out_s_car <= 	In_zero after 1ns when S_ms = "000" else
						In_one after 1ns when S_ms = "001" else
						In_c after 1ns when S_ms = "010" else
						In_v after 1ns when S_ms = "011" else
						In_z after 1ns when S_ms = "100" else
						In_n after 1ns when S_ms = "101" else
						In_not_c after 1ns when S_ms = "110" else
						In_not_z after 1ns when S_ms = "111";

end Behavioral;