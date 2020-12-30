----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Divine Mbunga
-- 
-- Create Date:    17:00:20 04/04/2019 
-- Design Name: 
-- Module Name:   Control Address Register- Behavioral 
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ControlAddressRegister is
	Port(	car_in : in STD_LOGIC_VECTOR(7 downto 0);
			s_car, reset : in STD_LOGIC;
			car_out : out STD_LOGIC_VECTOR(7 downto 0)
			);
end ControlAddressRegister;

architecture Behavioral of ControlAddressRegister is

begin
	process(reset, car_in)
	variable curr_car : STD_LOGIC_VECTOR(7 downto 0);
	variable temp_curr_car : integer;
	variable temp_inc_car : STD_LOGIC_VECTOR(7 downto 0);
	
	begin
		if(reset = '1') then curr_car := x"C0";
		elsif(s_car = '1') then curr_car := car_in;
		elsif(s_car = '0') then
			temp_curr_car := conv_integer(curr_car);
			temp_curr_car := temp_curr_car + conv_integer(1);
			temp_inc_car := conv_std_logic_vector(temp_curr_car, 8);
			curr_car := temp_inc_car;
		end if;
		car_out <= curr_car after 20ns;
	end process;
end Behavioral;
