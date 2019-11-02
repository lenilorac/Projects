----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Divine Mbunga
-- 
-- Create Date:    02:52:20 05/04/2019 
-- Design Name: 
-- Module Name:   2x8 Multiplexer - Behavioral 
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

entity mux_2_8 is
	Port(	In0_NA, In1_opcode : in STD_LOGIC_VECTOR(7 downto 0);
			S_mc : in STD_LOGIC;
			out_car : out STD_LOGIC_VECTOR(7 downto 0)
			);
end mux_2_8;

architecture Behavioral of mux_2_8 is

begin
	out_car <= 	In0_NA after 1ns when S_mc='0' else
					In1_opcode after 1ns when S_mc='1' else
					x"00" after 20ns;

end Behavioral;