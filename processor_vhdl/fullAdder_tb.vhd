----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Divine Mbunga
-- 
-- Create Date: 27.02.2019 00:24:19
-- Design Name: 
-- Module Name: Full Adder Test Bench - Behavioral
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity fullAdder_tb is
end fullAdder_tb;

architecture behavior of fullAdder_tb is
   --Component Declaration for the Unit Under Test(UUT)
   component fullAdder
      Port(x,y: in STD_LOGIC;
           C_in: in STD_LOGIC;
           C_out: out STD_LOGIC;
           S: out STD_LOGIC
           );
    end component;
    
    --Inputs
    signal x,y: STD_LOGIC :='0';
    signal C_in: STD_LOGIC :='0';
    
    --Outputs 
    signal C_out: STD_LOGIC;
    signal S: STD_LOGIC;
    
begin
  uut: fullAdder PORT MAP(
       x => x,
       y => y,
       C_in => C_in,
       C_out => C_out,
       S => S
       );
       
   stim_proc: process
   begin
     wait for 5ns;
     x <='1';
     
     wait for 5ns;
     x <='0';
     y <='1';
     
     wait for 5ns;
     x <= '1';
     
     wait for 5ns;
     C_in <='1';
     
     wait for 5ns;
     y <='0';
     
     wait for 5ns;
     x <='0';
     
   wait;
   end process;
end; 

