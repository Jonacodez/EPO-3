library IEEE;
use IEEE.std_logic_1164.ALL;

entity shift_reg_2 is
port(	input0, input1, input2, input3, input4, input5, input6, input7:	in std_logic_vector(4 downto 0);
	clk:			in std_logic;
	succes:			in std_logic;
	succes_count:		in std_logic;
	reset:			in std_logic;
	output: 		out std_logic_vector(4 downto 0)
);
end shift_reg_2;

