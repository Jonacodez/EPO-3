library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of button is

component input_buffer is
	port (d0, d1, d2, d3, d4, clk, reset: in std_logic; q0, q1, q2, q3, q4 : out std_logic);
end component input_buffer;


signal s1, s2	: std_logic_vector (4 downto 0);


begin

buf1: input_buffer port map(SW0, KEY0, KEY1, KEY2, KEY3, clk, reset,
			s1(0), s1(1), s1(2), s1(3), s1(4));
buf2: input_buffer port map(s1(0), s1(1), s1(2), s1(3), s1(4), clk, reset,
			s2(0), s2(1), s2(2), s2(3), s2(4));
	
	process(s2, pulse_len, SW1)
	begin
	
		if s2(0) = '0' then 
			if s2(1) = '0' then
				if pulse_len = "001" then
					notes_OUT  <= "00001"; --C1 short 
				elsif pulse_len = "010" then 
					notes_OUT  <= "00010"; --C1 mid
				elsif pulse_len = "100" then
					notes_OUT  <= "00011"; --C1 long
				else
					notes_OUT  <= "00100";
				end if;
			elsif s2(2) = '0' then
				if pulse_len = "001" then
					notes_OUT  <= "00101"; --D short
				elsif pulse_len = "010" then
					notes_OUT  <= "00110"; --D mid
				elsif pulse_len = "100" then
					notes_OUT  <= "00111"; --D long
				else
					notes_OUT  <= "00100";
				end if;
			elsif s2(3) = '0' then
				if pulse_len = "001" then
					notes_OUT  <= "01001"; --E short
				elsif pulse_len = "010" then
					notes_OUT  <= "01010"; --E mid
				elsif pulse_len = "100" then
					notes_OUT  <= "01011"; --E long
				else
					notes_OUT  <= "00100";
				end if;
			elsif s2(4) = '0' then
				if pulse_len = "001" then
					notes_OUT  <= "01101"; --F short
				elsif pulse_len = "010" then
					notes_OUT  <= "01110"; --F mid
				elsif pulse_len = "100" then
					notes_OUT  <= "01111"; --F long
				else
					notes_OUT  <= "00100";
				end if;
			end if;
		elsif s2(0) = '1' then
			if s2(1) = '0' then
				if pulse_len = "001" then
					notes_OUT  <= "10001"; --G short
				elsif pulse_len = "010" then
					notes_OUT  <= "10010"; --G mid
				elsif pulse_len = "100" then
					notes_OUT  <= "10011"; --G long
				else
					notes_OUT  <= "00100";
				end if;
			elsif s2(2) = '0' then
				if pulse_len = "001" then
					notes_OUT  <= "10101"; --A short
				elsif pulse_len = "010" then
					notes_OUT  <= "10110"; --A mid
				elsif pulse_len = "100" then
					notes_OUT  <= "10111"; --A long
				else
					notes_OUT  <= "00100";
				end if;
			elsif s2(3) = '0' then
				if pulse_len = "001" then
					notes_OUT  <= "11001"; --B short
				elsif pulse_len = "010" then
					notes_OUT  <= "11010"; --B mid
				elsif pulse_len = "100" then
					notes_OUT  <= "11011"; --B long
				else
					notes_OUT  <= "00100";
				end if;
			elsif s2(4) = '0' then
				if pulse_len = "001" then     --C2 short
					notes_OUT  <= "11101";
				elsif pulse_len = "010" then  
					notes_OUT <= "11110"; --C2 mid
				elsif pulse_len = "100" then
					notes_OUT <= "11111"; --C2 long
				else
					notes_OUT  <= "00100";
				end if;
			else 
				notes_OUT  <= "00100";  --blank, om latches te verkomen
			end if;
		end if;
		if SW1 = '1' then
			if s2(1) = '0' then
				notes_OUT  <= "00000";  --stop bit
			end if;
		end if;
	end process;



end architecture;




