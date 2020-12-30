----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:33:18 10/02/2019 
-- Design Name: 
-- Module Name:    2x16 Multiplexer Test Bench - Behavioral 
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

ENTITY mux2_16_tb IS
END mux2_16_tb;

ARCHITECTURE behavior OF mux2_16_tb IS
 -- Component Declaration for the Unit Under Test (UUT)
 COMPONENT mux2_16
  PORT(IN0: in STD_LOGIC_VECTOR(15 downto 0);
       IN1: in STD_LOGIC_VECTOR(15 downto 0);
       S: in STD_LOGIC;
       Z: out STD_LOGIC_VECTOR(15 downto 0)
       );
 END COMPONENT;
 
 --Inputs
 signal IN0:STD_LOGIC_VECTOR(15 downto 0):=(others =>'0');
 signal IN1:STD_LOGIC_VECTOR(15 downto 0):=(others =>'0');
 signal S:STD_LOGIC :='0';
 
 --Outputs
 signal Z:STD_LOGIC_VECTOR(15 downto 0);
 
BEGIN
  -- Instantiate the Unit Under Test (UUT)
  uut: mux2_16 PORT MAP(
      IN0 => IN0,
      IN1 => IN1,
      S   => S,
      Z   => Z
      );
      
   stim_proc: process
   begin
     
      IN0 <=X"FFFF";
      IN1 <=X"AAAA";
      
      wait for 10ns;
      S <='1';
      
      wait for 10ns;
      S <='0';
      
      wait for 10ns;
      S <='1';
      
   end process;
   
END;
      