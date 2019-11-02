----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Divine Mbunga
-- 
-- Create Date: 27.02.2019 01:33:06
-- Design Name: 
-- Module Name: Shifter Test Bench - Behavioral
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

entity shifter_tb is
end shifter_tb;

architecture behavior of shifter_tb is
   --Component Declaration of Unit Under Test (UUT)
   component shifter
      Port(B: in STD_LOGIC_VECTOR(15 downto 0);
           S: in STD_LOGIC_VECTOR(1 downto 0);
           IL: in STD_LOGIC;
           IR: in STD_LOGIC;
           H: out STD_LOGIC_VECTOR(15 downto 0)
           );
   end component;
   
   --Inputs
   signal B: STD_LOGIC_VECTOR(15 downto 0) :=(others=>'0');
   signal S:STD_LOGIC_VECTOR(1 downto 0) :=(others=>'0');
   signal IL: STD_LOGIC :='0';
   signal IR: STD_LOGIC :='0';
   
   --Outputs
   signal H: STD_LOGIC_VECTOR(15 downto 0); 
 
begin
  uut: shifter PORT MAP(
       B => B,
       S => S,
       IL => IL,
       IR => IR,
       H => H
       );
       
  stim_proc: process
  begin
    wait for 10ns;
    B <= x"FFFF";
    S <= "00";
    
	wait for 16ns;
	S <= "01";
		
	--wait for 16ns;
	--S <= ;
		
	wait for 16ns;
	B <= H;
	S <= "10";

   wait;
   end process;

end;    
    