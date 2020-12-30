----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Divine Mbunga
-- 
-- Create Date: 24.02.2019 13:42:02
-- Design Name: 
-- Module Name: Functional Unit - Behavioral
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

entity functionalUnit is
  Port(Fselect: in STD_LOGIC_VECTOR(4 downto 0);
       ain,bin: in STD_LOGIC_VECTOR(15 downto 0);
       n_fu,z_fu,v_fu,c_fu: out STD_LOGIC;
       F: out STD_LOGIC_VECTOR(15 downto 0)
      );
      
end functionalUnit;

architecture Behavioral of functionalUnit is
  component mux2_16
     Port(In0,In1:in STD_LOGIC_VECTOR(15 downto 0);
     S: in STD_LOGIC;
     Z: out STD_LOGIC_VECTOR(15 downto 0)
     );
  end component;
  
  component shifter
     Port(B: in STD_LOGIC_VECTOR(15 downto 0);
          S: in STD_LOGIC_VECTOR(1 downto 0);
          IL,IR: in STD_LOGIC ;
          H: out STD_LOGIC_VECTOR(15 downto 0)
          );
   end component;
   
   component aluUnit
      Port(a_in,b_in: in STD_LOGIC_VECTOR(15 downto 0);
           G_select: in STD_LOGIC_VECTOR(3 downto 0);
           V,C: out STD_LOGIC;
           G: out STD_LOGIC_VECTOR(15 downto 0)
           );
   end component;
   
   signal H_out,mux_out,alu_out: STD_LOGIC_VECTOR(15 downto 0);
   
begin
   shifter_0: shifter PORT MAP(
		      B => bin,
		      S => Fselect(3 downto 2),
		      IL => '0',
		      IR => '0',
		      H => H_out
	         );
	
	mux2_16_0: mux2_16 PORT MAP(
		       In0 => alu_out,
		       In1 => H_out,
		       s => Fselect(4),
		       z => mux_out
	           );
	
	alu_0: aluUnit PORT MAP(
		   a_in => ain,
		   b_in => bin,
		   G_select => Fselect(3 downto 0),
		   V => v_fu,
		   C => c_fu,
		   G => alu_out
	       );
	
	F <= mux_out;
	n_fu <= mux_out(15);
	z_fu <= (mux_out(15) or mux_out(14) or mux_out(13) or mux_out(12) or mux_out(11) 
			 or mux_out(10) or mux_out(9) or mux_out(8) or mux_out(7) or mux_out(6) 
			 or mux_out(5) or mux_out(4) or mux_out(3) or mux_out(2) or mux_out(1) or mux_out(0));

end Behavioral;