 ----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Divine Mbunga
-- 
-- Create Date:    17:15:04 04/04/2019 
-- Design Name: 
-- Module Name:   Instructions- Behavioral 
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

entity Instructions is
	Port(	IR_in : in STD_LOGIC_VECTOR(15 downto 0);
			IL_in : in STD_LOGIC;
			Opcode :  out STD_LOGIC_VECTOR(6 downto 0);
			DR_out, SA_out, SB_out : out STD_LOGIC_VECTOR(2 downto 0)
			);
end Instructions;

architecture Behavioral of Instructions is

begin
	Opcode <= IR_in(15 downto 9) after 1ns when IL_in = '1';
	DR_out <= IR_in(8 downto 6) after 1ns when IL_in = '1';
	SA_out <= IR_in(5 downto 3) after 1ns when IL_in = '1';
	SB_out <= IR_in(2 downto 0) after 1ns when IL_in = '1';

end Behavioral;
