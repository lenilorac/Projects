----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Divine Mbunga
-- 
-- Create Date: 26.02.2019 11:41:09
-- Design Name: 
-- Module Name: 2X1 Multiplexer Test Bench - Behavioral
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

entity mux2_1_tb is
end mux2_1_tb;

architecture behavior of mux2_1_tb is
 --Component Declaration for the Unit Under Test (UUT)
 component mux2_1
    Port(Bi,S0,S1: in STD_LOGIC;
         Yi: out STD_LOGIC
         );
 end component;
 
 --Inputs
 signal Bi: STD_LOGIC:='0';
 signal S0,S1: STD_LOGIC:= '0';
 
 --Outputs
 signal Yi: STD_LOGIC:='0'; 
 
begin
  uut: mux2_1 PORT MAP(
       Bi => Bi,
       S0 => S0,
       S1 => S1,
       Yi => Yi
       );
       
  stim_proc: process
  begin
    S0 <= '0';
    S1 <= '1';
    
    wait for 5ns;
    Bi <= '1';
    
    wait for 5ns;
    Bi <= '0';
  wait;
  end process;
end;