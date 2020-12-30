----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:52:20 11/02/2019 
-- Design Name: 
-- Module Name:   Register - Behavioral 
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

ENTITY reg IS
 PORT( D: in STD_LOGIC_VECTOR(15 downto 0);
       load0,load1,clk: in STD_LOGIC;
       Q: out STD_LOGIC_VECTOR(15 downto 0)
       );
       
END reg;

ARCHITECTURE Behavioral OF reg IS
CONSTANT gate_delay:Time :=5ns;
 BEGIN  process(clk)
        begin
           if(rising_edge(clk))then
             if((load0 ='1') and (load1 ='1'))then
               Q<=D after gate_delay;
             end if;
           end if;
        end process;
END Behavioral;
  