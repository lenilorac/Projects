----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Divine Mbunga
-- 
-- Create Date: 24.02.2019 13:42:02
-- Design Name: 
-- Module Name: Logic Circuit A B - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity logicCircuit_ab is
	Port(a_logic_in,b_logic_in: in STD_LOGIC_VECTOR(15 downto 0);
		 select_in: in STD_LOGIC_VECTOR(1 downto 0);
		 logic_output_ab: out STD_LOGIC_VECTOR(15 downto 0)
	     );
end logicCircuit_ab;

architecture Behavioral of logicCircuit_ab is

begin
	logic_output_ab <= 	(a_logic_in and b_logic_in) after 1ns when select_in = "00" else
						(a_logic_in or b_logic_in) after 1ns when select_in = "01" else
						(a_logic_in xor b_logic_in) after 1ns when select_in = "10" else
						(not (a_logic_in)) after 1ns when select_in="11";

end Behavioral;