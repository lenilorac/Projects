----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Divine Mbunga
-- 
-- Create Date: 26.02.2019 23:45:01
-- Design Name: 
-- Module Name: 3x1 Multiplexer Test Bench - Behavioral
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

entity mux3_1_tb is
end mux3_1_tb;

architecture behavior of mux3_1_tb is
  --Component Declaration for the Unit Under Test (UUT)
  component mux3_1
     Port(In0: in STD_LOGIC;
          IN1: in STD_LOGIC;
          IN2: in STD_LOGIC;
          S0: in STD_LOGIC;
          S1: in STD_LOGIC;
          Z: out STD_LOGIC
          );
   end component;
   
   --Inputs
   signal In0,In1,In2: STD_LOGIC :='0';
   signal S0,S1: STD_LOGIC :='0';
   
   --Outputs
   signal Z:STD_LOGIC;
   
begin
   uut: mux3_1 PORT MAP(
        In0 => In0,
        In1 => In1,
        In2 => In2,
        S0 => S0,
        S1 => S1,
        Z => Z
        );
        
   stim_proc: process
   begin
      wait for 10ns;
      In0 <= '0';
      In1 <= '1';
      In2 <= '0';
      
      wait for 5ns;
      S0 <= '0';
      S1 <= '1';
      
      wait for 5ns;
      S0 <= '1';
      S1 <= '0';
      
      wait for 5ns;
      S0 <= '1';
      S1 <= '1';
   wait;
   end process;
end;
          