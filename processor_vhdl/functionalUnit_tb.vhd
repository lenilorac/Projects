----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Divine Mbunga
-- 
-- Create Date: 27.02.2019 00:37:08
-- Design Name: 
-- Module Name: Functional Unit Test Bench - Behavioral
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

entity functionalUnit_tb is
end functionalUnit_tb;

architecture behavior of functionalUnit_tb is
   --Component Declaration for the Unit Under Test (UUT)
   component functionalUnit
      Port(Fselect: in STD_LOGIC_VECTOR(4 downto 0);
           ain,bin: in STD_LOGIC_VECTOR(15 downto 0);
           n_fu,z_fu,v_fu,c_fu: out STD_LOGIC;
           F: out STD_LOGIC_VECTOR(15 downto 0)
           );
   end component;
   
   --Inputs 
   signal Fselect: STD_LOGIC_VECTOR(4 downto 0) :=(others =>'0');
   signal ain,bin: STD_LOGIC_VECTOR(15 downto 0) :=(others =>'0');
   
   --Ouputs
   signal n_fu,z_fu,v_fu,c_fu: STD_LOGIC;
   signal F: STD_LOGIC_VECTOR(15 downto 0);
   
begin
  uut: functionalUnit PORT MAP(
       Fselect => Fselect,
       ain => ain,
       bin => bin,
       n_fu => n_fu,
       z_fu => z_fu,
       v_fu => v_fu,
       c_fu => c_fu,
       F => F
       );
       
  stim_proc: process
  begin
    ain <= x"BBBB";
    bin <= x"CCCC";
    
    wait for 10ns;
    Fselect <= "00000";
    
    wait for 10ns;
    Fselect <= "00001";
    
    wait for 10ns;
    Fselect <= "00010";
    
    wait for 10ns;
    Fselect <= "00011";
    
    wait for 10ns;
    Fselect <= "00100";
    
    wait for 10ns;
    Fselect <= "00101";
    
    wait for 10ns;
    Fselect <= "00110";
    
    wait for 10ns;
    Fselect <= "00111";
    
    wait for 10ns;
    Fselect <= "01000";
    
    wait for 10ns;
    Fselect <= "01001";
    
    wait for 10ns;
    Fselect <= "01010";
    
    wait for 10ns;
    Fselect <= "01011";
    
    wait for 10ns;
    Fselect <= "01100";
    
    wait for 10ns;
    Fselect <= "01101";
    
    wait for 10ns;
    Fselect <= "01110";

    
  wait;
  end process;
end;
