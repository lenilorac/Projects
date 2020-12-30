----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:29:26 10/02/2019 
-- Design Name: 
-- Module Name:    2x16 Multiplexer - Behavioral 
-- Project Name:   Project1-DataPathDesign
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

entity mux2_16 is
 Port( In0,In1: in STD_LOGIC_VECTOR(15 downto 0);
       s: in STD_LOGIC;
       Z: out STD_LOGIC_VECTOR(15 downto 0)
       );
end mux2_16;
 
architecture Behavioral of mux2_16 is
constant gate_delay:Time :=1ns;
begin
  Z <= In0 after gate_delay when s ='0' else
       In1 after gate_delay when s='1' else
      x"0000" after gate_delay;
end Behavioral;