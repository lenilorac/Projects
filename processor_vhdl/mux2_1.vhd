----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Divine Mbunga
-- 
-- Create Date: 24.02.2019 13:42:02
-- Design Name: 
-- Module Name: 2x1 Multiplexer - Behavioral
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

entity mux2_1 is
  Port(Bi,S0,S1: in STD_LOGIC;
       Yi: out STD_LOGIC
       );
end mux2_1;

architecture Behavioral of mux2_1 is

begin
  Yi <= S0 after 1ns when Bi='1' else
        S1 after 1ns when Bi='0' else
        '0' after 1ns;

end Behavioral;