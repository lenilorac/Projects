----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Divine Mbunga
-- 
-- Create Date:    16:55:20 04/04/2019 
-- Design Name: 
-- Module Name:   Program Counter - Behavioral 
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity pc is
	Port(	PC_module_in : in STD_LOGIC_VECTOR(15 downto 0);
			PL_module_in, PI_module_in, reset : in STD_LOGIC;
			PC_module_out : out STD_LOGIC_VECTOR(15 downto 0)
			);
end pc;

architecture Behavioral of pc is
begin
	process(reset, PL_module_in, PI_module_in)
	variable current_PC : STD_LOGIC_VECTOR(15 downto 0);
	variable temp_curr_PC : integer;
	variable temp_inc_PC : STD_LOGIC_VECTOR(15 downto 0);
	
	begin
		if(reset = '1') then current_PC := x"0000";
		elsif(PL_module_in = '1') then 
			current_PC := current_PC + PC_module_in;
		elsif(PI_module_in = '1') then
			temp_curr_PC := conv_integer(current_PC); -- get current allocation
			temp_curr_PC := temp_curr_PC + conv_integer(1); -- increment
			temp_inc_PC := conv_std_logic_vector(temp_curr_PC, 16); -- cast from int to vector
			current_PC := temp_inc_PC; -- store as current PC
		end if;
		PC_module_out <= current_PC after 2ns;
	end process;

end Behavioral;