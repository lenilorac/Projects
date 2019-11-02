----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Divine Mbunga
-- 
-- Create Date: 24.02.2019 13:42:02
-- Design Name: 
-- Module Name: rippleAdder - Behavioral
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

entity rippleAdder is
  Port(A,B: in STD_LOGIC_VECTOR(15 downto 0);
       C_in: in STD_LOGIC;
       C_out, V_out: out STD_LOGIC;
       G_out: out STD_LOGIC_VECTOR(15 downto 0)
       );
end rippleAdder;

architecture Behavioral of rippleAdder is
   Component fullAdder
      Port(x, y, C_in: in STD_LOGIC;
           C_out, S: out STD_LOGIC
           );
   End Component;

   --Signals
   signal C0,C1,C2,C3,C4,C5,C6,C7,C8,C9,C10,C11,C12,C13,C14,C15: STD_LOGIC :='0';
   signal Cout: STD_LOGIC;
   
begin
   fullAdder00: fullAdder PORT MAP(
                x => A(0),
                y => B(0),
                C_in => C_in,
                C_out => C0,
                S => G_out(0)
                );
                
   fullAdder01: fullAdder PORT MAP(
                x => A(1),
                y => B(1),
                C_in => C0,
                C_out => C1,
                S => G_out(1)
                );                
    
   fullAdder02: fullAdder PORT MAP(
                x => A(2),
                y => B(2),
                C_in => C1,
                C_out => C2,
                S => G_out(2)
                );
                
   fullAdder03: fullAdder PORT MAP(
                x => A(3),
                y => B(3),
                C_in => C2,
                C_out => C3,
                S => G_out(3)
                );
                
   fullAdder04: fullAdder PORT MAP(
                x => A(4),
                y => B(4),
                C_in => C3,
                C_out => C4,
                S => G_out(4)
                );
                
   fullAdder05: fullAdder PORT MAP(
                x => A(5),
                y => B(5),
                C_in => C4,
                C_out => C5,
                S => G_out(5)
                );
                
   fullAdder06: fullAdder PORT MAP(
                x => A(6),
                y => B(6),
                C_in => C5,
                C_out => C6,
                S => G_out(6)
                );
                
   fullAdder07: fullAdder PORT MAP(
                x => A(7),
                y => B(7),
                C_in => C6,
                C_out => C7,
                S => G_out(7)
                );
                
   fullAdder08: fullAdder PORT MAP(
                x => A(8),
                y => B(8),
                C_in => C7,
                C_out => C8,
                S => G_out(8)
                );
                
   fullAdder09: fullAdder PORT MAP(
                x => A(9),
                y => B(9),
                C_in => C8,
                C_out => C9,
                S => G_out(9)
                );
                
   fullAdder10: fullAdder PORT MAP(
                x => A(10),
                y => B(10),
                C_in => C9,
                C_out => C10,
                S => G_out(10)
                );
                
   fullAdder11: fullAdder PORT MAP(
                x => A(11),
                y => B(11),
                C_in => C10,
                C_out => C11,
                S => G_out(11)
                );
                
   fullAdder12: fullAdder PORT MAP(
                x => A(12),
                y => B(12),
                C_in => C11,
                C_out => C12,
                S => G_out(12)
                );
                
   fullAdder13: fullAdder PORT MAP(
                x => A(13),
                y => B(13),
                C_in => C12,
                C_out => C13,
                S => G_out(13)
                );
                
   fullAdder14: fullAdder PORT MAP(
                x => A(14),
                y => B(14),
                C_in => C13,
                C_out => C14,
                S => G_out(14)
                );
                
   fullAdder15: fullAdder PORT MAP(
                x => A(15),
                y => B(15),
                C_in => C14,
                C_out => C15,
                S => G_out(15)
                );
   
   C_out <= C15;
   V_out <= C15 xor C14;

end Behavioral;
