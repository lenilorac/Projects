----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Divine Mbunga
-- 
-- Create Date: 27.02.2019 01:22:06
-- Design Name: 
-- Module Name: Ripple Adder Test Bench - Behavioral
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

entity rippleAdder_tb is
end rippleAdder_tb;
 
architecture behavior of rippleAdder_tb is
    -- Component Declaration for the Unit Under Test (UUT)
    component rippleAdder
       Port(A : in  STD_LOGIC_VECTOR(15 downto 0);
            B : in  STD_LOGIC_VECTOR(15 downto 0);
            C_in: in STD_LOGIC;
            C_out: out STD_LOGIC;
            V_out: out STD_LOGIC;
            G_out : out STD_LOGIC_VECTOR(15 downto 0)
            );
    end component;
   
   --Inputs
   signal A,B: STD_LOGIC_VECTOR(15 downto 0) := (others =>'0');
   signal C_in: STD_LOGIC :='0';

 	--Outputs
   signal C_out,V_out: STD_LOGIC;
   signal G_out : STD_LOGIC_VECTOR(15 downto 0);
 
begin
   uut: rippleAdder PORT MAP (
        A => A,
        B => B,
        C_in => C_in,
        C_out => C_out,
        V_out => V_out,
        G_out => G_out
        ); 

   stim_proc: process
   begin		
	 A <= x"AAAA";
	 B <= x"FBAA";
	 C_in <= '1';
		
	 wait for 80ns;
	 A <= x"FFFF";
	 B <= x"0000";
     C_in <= '1';
     
     
	
   wait;
   end process;

end;