----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:52:20 11/02/2019 
-- Design Name: 
-- Module Name:   Register Test Bench- Behavioral 
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

ENTITY reg_tb IS
END reg_tb;

ARCHITECTURE behavior OF reg_tb IS
 -- Component Declaration for the Unit Under Test (UUT)
  COMPONENT reg
   PORT(D:in STD_LOGIC_VECTOR(15 downto 0);
        load0:in STD_LOGIC;
        load1:in STD_LOGIC;
        clk:in STD_LOGIC;
        Q:out STD_LOGIC_VECTOR(15 downto 0)
        );
   END COMPONENT;
   
   --Inputs
   signal D: STD_LOGIC_VECTOR(15 downto 0):=(others=>'0');
   signal load0: STD_LOGIC :='0';
   signal load1:STD_LOGIC :='0';
   signal clk: STD_LOGIC :='0';

 	--Outputs
   signal Q: STD_LOGIC_VECTOR(15 downto 0);

   -- Clock period definitions
   constant clk_time:Time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: reg PORT MAP (
          D=>D,
          load0=>load0,
          load1=>load1,
          clk=>clk,
          Q=>Q
        );

   -- Clock process 
   clk_process:process
   begin
		clk<='0';
		wait for clk_time/2;
		clk<='1';
		wait for clk_time/2;
   end process;

   stim_proc: process
   begin		
		wait for 10ns;
		D<= X"FFFF";
		load0<='1';
		load1<='1';
		
		wait for 15ns;
		D <= x"BBBB";
		load0 <= '0';
		
		wait for 10ns;
		load1 <= '0';
		
		wait for 10ns;
		load0 <= '1';
		load1 <= '1';
   end process;

END;