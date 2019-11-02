----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Divine Mbunga
-- 
-- Create Date: 24.02.2019 13:42:02
-- Design Name: 
-- Module Name: Logic Circuit B - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity logicCircuit_b is
	Port(B: in STD_LOGIC_VECTOR(15 downto 0);
		 S_in: in STD_LOGIC_VECTOR(1 downto 0);
		 Y_out: out STD_LOGIC_VECTOR(15 downto 0)
	     );
end logicCircuit_b;

architecture Behavioral of logicCircuit_b is
	
	component mux2_1
	   Port(Bi, S0, S1: in STD_LOGIC;
		    Yi: out STD_LOGIC
	        );
	end component;

begin
	mux_0: mux2_1 PORT MAP(
		   Bi => B(0),
		   S0 => S_in(0),
		   S1 => S_in(1),
		   Yi => Y_out(0)
	       );
	
	mux_1: mux2_1 PORT MAP(
		   Bi => B(1),
		   S0 => S_in(0),
		   S1 => S_in(1),
		   Yi => Y_out(1)
           );
	
	mux_2: mux2_1 PORT MAP(
		   Bi => B(2),
		   S0 => S_in(0),
		   S1 => S_in(1),
		   Yi => Y_out(2)
	       );
	
	mux_3: mux2_1 PORT MAP(
		   Bi => B(3),
		   S0 => S_in(0),
		   S1 => S_in(1),
		   Yi => Y_out(3)
	       );
	
	mux_4: mux2_1 PORT MAP(
		   Bi => B(4),
		   S0 => S_in(0),
		   S1 => S_in(1),
		   Yi => Y_out(4)
	       );
	
	mux_5: mux2_1 PORT MAP(
		   Bi => B(5),
		   S0 => S_in(0),
		   S1 => S_in(1),
		   Yi => Y_out(5)
	       );
	
	mux_6: mux2_1 PORT MAP(
		   Bi => B(6),
		   S0 => S_in(0),
		   S1 => S_in(1),
		   Yi => Y_out(6)
           );
	
	mux_7: mux2_1 PORT MAP(
		   Bi => B(7),
		   S0 => S_in(0),
		   S1 => S_in(1),
		   Yi => Y_out(7)
	       );
	
	mux_8: mux2_1 PORT MAP(
		   Bi => B(8),
		   S0 => S_in(0),
		   S1 => S_in(1),
		   Yi => Y_out(8)
	       );
	
	mux_9: mux2_1 PORT MAP(
		   Bi => B(9),
		   S0 => S_in(0),
		   S1 => S_in(1),
		   Yi => Y_out(9)
	      );
	
	mux_10: mux2_1 PORT MAP(
		    Bi => B(10),
		    S0 => S_in(0),
		    S1 => S_in(1),
		    Yi => Y_out(10)
	        );
	        
    mux_11: mux2_1 PORT MAP(
		    Bi => B(11),
		    S0 => S_in(0),
		    S1 => S_in(1),
		    Yi => Y_out(11)
	        );
    mux_12: mux2_1 PORT MAP(
		    Bi => B(12),
		    S0 => S_in(0),
		    S1 => S_in(1),
		    Yi => Y_out(12)
	        );
	mux_13: mux2_1 PORT MAP(
		    Bi => B(13),
		    S0 => S_in(0),
		    S1 => S_in(1),
		    Yi => Y_out(13)
	        );
	mux_14: mux2_1 PORT MAP(
		    Bi => B(14),
		    S0 => S_in(0),
		    S1 => S_in(1),
		    Yi => Y_out(14)
	        );
	mux_15: mux2_1 PORT MAP(
		    Bi => B(15),
		    S0 => S_in(0),
		    S1 => S_in(1),
		    Yi => Y_out(15)
	        );
end Behavioral;