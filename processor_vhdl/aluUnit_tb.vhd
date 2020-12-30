----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Divine Mbunga
-- 
-- Create Date: 27.02.2019 00:01:00
-- Design Name: 
-- Module Name: ALU Unit Test Bench - Behavioral
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

entity aluUnit_tb is
end aluUnit_tb;

architecture behavior of aluUnit_tb is
   --Component Declaration for the Unit Under Test(UUT)
   component aluUnit
      Port(a_in: in STD_LOGIC_VECTOR(15 downto 0);
           b_in: in STD_LOGIC_VECTOR(15 downto 0);
           G_select: in STD_LOGIC_VECTOR(3 downto 0);
           V: out STD_LOGIC;
           C: out STD_LOGIC;
           G: out STD_LOGIC_VECTOR(15 downto 0)
           );
    end component;
    
    --Inputs
    signal ain,bin: STD_LOGIC_VECTOR(15 downto 0) :=(others =>'0');
    signal G_select: STD_lOGIC_VECTOR(3 downto 0) :=(others =>'0');
    
    --Outputs
    signal V,C: STD_LOGIC;
    signal G: STD_LOGIC_VECTOR(15 downto 0);
    
begin
  uut: aluUnit PORT MAP(
       a_in => ain,
       b_in => bin,
       G_select => G_select,
       V => V,
       C => C,
       G => G
       );
       
   stim_proc: process
   begin
     ain <= x"FFFF";
     bin <= x"0000";
     G_select <= "0000";
     
     wait for 100ns;
     G_select <="0001";

     wait for 100ns;
     G_select <="0010";

     --wait for 100ns;
    -- G_select <="0010";
     
     wait for 100ns;
     G_select <="0011";
     
     wait for 100ns;
     G_select <="0100";
    
     wait for 100ns;
     G_select <="0101";
     
     wait for 100ns;
     G_select <="0110";
     
     wait for 100ns;
     G_select <="0111";
     
   wait;
   end process;
end;   