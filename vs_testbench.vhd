library ieee;
use ieee.std_logic_1164.all;  
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity vs_testbench is			-- entity declaration
end vs_testbench;

architecture TB of vs_testbench is

    component shift_reg
    port(   input:		in std_logic_vector(4 downto 0);
	clk:		in std_logic;
	shift:		in std_logic;
	output0, output1, output2, output3, output4, output5, output6, output7: out std_logic_vector(4 downto 0)
    );
    end component;

    signal T_I:		std_logic_vector(4 downto 0);
    signal T_clock:	std_logic;
    signal T_shift:	std_logic;
    signal o0, o1, o2, o3, o4, o5, o6, o7: std_logic_vector(4 downto 0);

begin

    U_shifter: shift_reg port map (T_I, T_clock, T_shift, o0, o1, o2, o3, o4, o5, o6, o7);
	
    -- concurrent process of clock
    process
    begin
	T_clock <= '0';
	wait for 5 ns;
	T_clock <= '1';
	wait for 5 ns;
    end process;

    -- concurrent process of test	
    process

	variable err_cnt: integer := 0;

    begin								
	T_shift <= '0';
	wait for 20 ns;
	T_I <= "10101";
	T_shift <= '1';
	wait for 20 ns;
	T_shift <= '0';
	T_I <= "01010";	 		-- 1st/2nd bit input
	wait for 20 ns;
	T_shift <= '1';
	wait for 20 ns;
	T_shift <= '0';
	T_I <= "00000";			-- 3rd bit input
	wait for 10 ns;
	T_shift <= '1';
	wait for 20 ns;
	T_shift <= '0';	
	wait for 10 ns;
	T_shift <= '1';
	wait for 20 ns;
	T_shift <= '0';			-- 3rd bit input
	wait for 10 ns;
	T_shift <= '1';
	wait for 20 ns;
	T_shift <= '0';	
	wait for 10 ns;
	T_shift <= '1';
	wait for 20 ns;
	T_shift <= '0';			-- 3rd bit input
	wait for 10 ns;
	T_shift <= '1';
	wait for 20 ns;
	T_shift <= '0';	
	wait for 10 ns;
	T_shift <= '1';
	wait for 20 ns;
	T_shift <= '0';				-- 4th bit input
	wait;
    end process;


end TB;

----------------------------------------------------------------

-----------------------------------------------------------------