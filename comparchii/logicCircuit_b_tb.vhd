----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Divine Mbunga
-- 
-- Create Date: 27.02.2019 01:15:04
-- Design Name: 
-- Module Name: Logic Circuit B Test Bench - Behavioral
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

entity logicCircuit_b_tb is
end logicCircuit_b_tb;

architecture behavior of logicCircuit_b_tb is
   --Component Declaration of Unit Under Test (UUT)
   component logicCircuit_b
      Port(B: in STD_LOGIC_VECTOR(15 downto 0);
           S_in: in STD_LOGIC_VECTOR(1 downto 0);
           Y_out: out STD_LOGIC_VECTOR(15 downto 0)
           );
   end component;
   
   --Inputs
   signal B: STD_LOGIC_VECTOR(15 downto 0) :=(others =>'0');
   signal S_in: STD_LOGIC_VECTOR(1 downto 0) :=(others =>'0');

 	--Outputs
   signal Y_out: STD_LOGIC_VECTOR(15 downto 0);
 
begin
  uut: logicCircuit_b PORT MAP (
        B => B,
        S_in => S_in,
        Y_out => Y_out
        );

  stim_proc: process
  begin		
	B <= x"AAAA";
	S_in <= "00";
		
	wait for 5ns;
	S_in <= "01";
		
	wait for 5ns;
	S_in <= "10";
		
	wait for 5ns;
	S_in <= "11";

   wait;
   end process;

end;
