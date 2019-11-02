----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Divine Mbunga
-- 
-- Create Date: 27.02.2019 00:59:07
-- Design Name: 
-- Module Name: Logic Circuit A B Test Bench - Behavioral
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
--use IEEE.STD_LOGIC_ARITH.ALL;
--use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity logicCircuit_ab_tb is
end logicCircuit_ab_tb;

architecture behavioral of logicCircuit_ab_tb is
   --Component Declaration for the Unit Under Test (UUT)
   component logicCircuit_ab
      Port(a_logic_in,b_logic_in: in STD_LOGIC_VECTOR(15 downto 0);
           select_in: in STD_LOGIC_VECTOR(1 downto 0);
           logic_output_ab: out STD_LOGIC_VECTOR(15 downto 0)
           );
    end component;
    
    --Inputs
    signal a_logic_in,b_logic_in: STD_LOGIC_VECTOR(15 downto 0) :=(others =>'0');
    signal select_in: STD_LOGIC_VECTOR(1 downto 0) :=(others=>'0');
    
    --Outputs
    signal logic_output_ab: STD_LOGIC_VECTOR(15 downto 0);
    
begin
  uut: logicCircuit_ab PORT MAP(
       a_logic_in => a_logic_in,
       b_logic_in => b_logic_in,
       select_in => select_in,
       logic_output_ab => logic_output_ab
       );
       
  stim_proc: process
  begin
    wait for 5ns;
    a_logic_in <= x"AAAA";
	b_logic_in <= x"8888";
	select_in <= "00";
		
	wait for 5ns;
	select_in <= "01";
		
	wait for 5ns;
	select_in <= "10";
	
	wait for 5ns;
	select_in <= "11";

    wait;
   end process;

end;