----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Divine Mbunga
-- 
-- Create Date: 24.02.2019 13:42:02
-- Design Name: 
-- Module Name: fullAdder - Behavioral
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

entity fullAdder is
   Port(x,y,C_in: in STD_LOGIC;
        C_out, S: out STD_LOGIC
        );
end fullAdder;

architecture Behavioral of fullAdder is

	signal S0, S1, S2 : STD_LOGIC;
	
begin
	S0 <= (x xor y) after 1ns;
	S1 <= (C_in and S0) after 1ns;
	S2 <= (x and y) after 1ns;
	S <= (S0 xor C_in) after 1ns;
	C_out <= (S1 or S2) after 1ns;

end Behavioral;