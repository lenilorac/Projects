----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Divine Mbunga
-- 
-- Create Date: 24.02.2019 13:42:02
-- Design Name: 
-- Module Name: AlU Unit - Behavioral
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

entity aluUnit is
	Port(a_in, b_in: in STD_LOGIC_VECTOR(15 downto 0);
		 G_select: in STD_LOGIC_VECTOR(3 downto 0);
		 V, C: out STD_LOGIC; 
		 G: out STD_LOGIC_VECTOR(15 downto 0)
	    );

end aluUnit;

architecture Behavioral of aluUnit is

	Component rippleAdder
		Port(A, B: in STD_LOGIC_VECTOR(15 downto 0);
			 C_in: in STD_LOGIC;
			 C_out, V_out: out STD_LOGIC;
			 G_out: out STD_LOGIC_VECTOR(15 downto 0)
		     );
	end Component;

	Component logicCircuit_ab
		Port(a_logic_in, b_logic_in: in STD_LOGIC_VECTOR(15 downto 0);
			 select_in: in STD_LOGIC_VECTOR(1 downto 0);
			 logic_output_ab: out STD_LOGIC_VECTOR(15 downto 0)
		     );
	end Component;

	Component logicCircuit_b
		Port(B: in STD_LOGIC_VECTOR(15 downto 0);
			 S_in: in STD_LOGIC_VECTOR(1 downto 0);
			 Y_out: out STD_LOGIC_VECTOR(15 downto 0)
		     );
	end Component;
	
	Component mux2_16
		Port(In0, In1: in STD_LOGIC_VECTOR(15 downto 0);
			 s: in STD_LOGIC;
			 Z: out STD_LOGIC_VECTOR(15 downto 0)
		     );
	End Component;
	
	signal logic_out, logic_output_ab, ripple_out : STD_LOGIC_VECTOR(15 downto 0);
	
begin
	
	rAdder: rippleAdder PORT MAP(
			A => a_in,
			B => b_in,
			C_in => G_select(0),
			C_out => C,
			V_out => V,
			G_out => ripple_out
	        );
	
	logic_circuit_ab00: logicCircuit_ab PORT MAP(
			          a_logic_in => a_in,
			          b_logic_in => b_in,
			          select_in => G_select(2 downto 1),
			          logic_output_ab => logic_output_ab
      	              );
	
	logic_circuit_b00 : logicCircuit_b PORT MAP(
			          B => b_in,
			          S_in => G_select(2 downto 1),
			          Y_out => logic_out
	                  );
	
	mux2_1600: mux2_16 PORT MAP(
			 In0 => ripple_out,
			 In1 => logic_output_ab,
			 s => G_select(3),
			 Z => G
	         );

end Behavioral;