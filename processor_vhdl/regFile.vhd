----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Divine Mbunga
-- 
-- Create Date:    02:51:50 05/04/2019 
-- Design Name: 
-- Module Name:   Register File- Behavioral 
-- Project Name:   project-2-Processor
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
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity regFile is
	Port(	des_d, add_a, add_b : in STD_LOGIC_VECTOR(3 downto 0);
			Clk, load_in : in STD_LOGIC;
			data : in STD_LOGIC_VECTOR(15 downto 0);
			out_data_a, out_data_b : out STD_LOGIC_VECTOR(15 downto 0)
			);
end regFile;

architecture Behavioral of regFile is
	component reg --dunno what i called mine
		Port(	D : in STD_LOGIC_VECTOR(15 downto 0);
				load0, load1, clk : in STD_LOGIC;
				Q : out STD_LOGIC_VECTOR(15 downto 0)
				);
	end component;
	
	component decoder_4_9
		Port(	A0, A1, A2, A3 : in STD_LOGIC;
				Q0, Q1, Q2, Q3, Q4, Q5, Q6, Q7, Q8 : out STD_LOGIC
				);
	end component;
	
	component mux2_16
		Port(	In0, In1 : in STD_LOGIC_VECTOR(15 downto 0);
				s : in STD_LOGIC;
				Z : out STD_LOGIC_VECTOR(15 downto 0)
				);
	end component;
	
	component mux_9_16
		Port(	In0, In1, In2, In3, In4, In5, In6, In7, In8 : in STD_LOGIC_VECTOR(15 downto 0);
				S0, S1, S2, S3 : in STD_LOGIC;
				Z : out STD_LOGIC_VECTOR(15 downto 0)
				);
	end component;
	
	signal load_reg0, load_reg1, load_reg2, load_reg3, load_reg4, load_reg5, load_reg6, load_reg7, load_reg8 : STD_LOGIC;
	signal reg0_q, reg1_q, reg2_q, reg3_q, reg4_q, reg5_q, reg6_q, reg7_q, reg8_q, out_sig_a, out_sig_b : STD_LOGIC_VECTOR(15 downto 0);

begin
	--reg0
	reg0: reg PORT MAP(
		D => data,
		load0 => load_reg0,
		load1 => load_in,
		clk => Clk,
		Q => reg0_q
	);
	
	--reg1
	reg1: reg PORT MAP(
		D => data,
		load0 => load_reg1,
		load1 => load_in,
		clk => Clk,
		Q => reg1_q
	);
	
	--reg2
	reg2: reg PORT MAP(
		D => data,
		load0 => load_reg2,
		load1 => load_in,
		clk => Clk,
		Q => reg2_q
	);
	
	--reg3
	reg3: reg PORT MAP(
		D => data,
		load0 => load_reg3,
		load1 => load_in,
		clk => Clk,
		Q => reg3_q
	);
	
	--reg4
	reg4: reg PORT MAP(
		D => data,
		load0 => load_reg4,
		load1 => load_in,
		clk => Clk,
		Q => reg4_q
	);
	
	--reg5
	reg5: reg PORT MAP(
		D => data,
		load0 => load_reg5,
		load1 => load_in,
		clk => Clk,
		Q => reg5_q
	);
	
	--reg6
	reg6: reg PORT MAP(
		D => data,
		load0 => load_reg6,
		load1 => load_in,
		clk => Clk,
		Q => reg6_q
	);
	
	--reg7
	reg7: reg PORT MAP(
		D => data,
		load0 => load_reg7,
		load1 => load_in,
		clk => Clk,
		Q => reg7_q
	);
	
	--reg8
	reg8: reg PORT MAP(
		D => data,
		load0 => load_reg8,
		load1 => load_in,
		clk => Clk,
		Q => reg8_q
	);

	DestDecoder4to9 : decoder_4_9 PORT MAP(
		A0 => des_d(0),
		A1 => des_d(1),
		A2 => des_d(2),
		A3 => des_d(3),
		Q0 => load_reg0,
		Q1 => load_reg1,
		Q2 => load_reg2,
		Q3 => load_reg3,
		Q4 => load_reg4,
		Q5 => load_reg5,
		Q6 => load_reg6,
		Q7 => load_reg7,
		Q8 => load_reg8
	);
	
	Mux9to16A : mux_9_16 PORT MAP(
		In0 => reg0_q,
		In1 => reg1_q,
		In2 => reg2_q,
		In3 => reg3_q,
		In4 => reg4_q,
		In5 => reg5_q,
		In6 => reg6_q,
		In7 => reg7_q,
		In8 => reg8_q,
		S0 => add_b(0),
		S1 => add_b(1),
		S2 => add_b(2),
		S3 => add_b(3),
		Z => out_sig_a
	);
	
	Mux9to16B : mux_9_16 PORT MAP(
		In0 => reg0_q,
		In1 => reg1_q,
		In2 => reg2_q,
		In3 => reg3_q,
		In4 => reg4_q,
		In5 => reg5_q,
		In6 => reg6_q,
		In7 => reg7_q,
		In8 => reg8_q,
		S0 => add_b(0),
		S1 => add_b(1),
		S2 => add_b(2),
		S3 => add_b(3),
		Z => out_sig_b
	);
	
	out_data_a <= out_sig_a;
	out_data_b <= out_sig_b;

end Behavioral;
