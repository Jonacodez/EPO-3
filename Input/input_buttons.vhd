library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

--schrijf flipflop die de noten onthoudt nadat het is vastgehouden

entity button is
port(   clk  : in std_logic;
	reset: in std_logic;
	KEY0 : in std_logic;
	KEY1 : in std_logic;
	KEY2 : in std_logic;
	KEY3 : in std_logic;
	SW0  : in std_logic;
	SW1  : in std_logic;
	notes_OUT : out std_logic_vector(4 downto 0)
     );
end button;

architecture behaviour of button is

component pulse_length port(
	KEY0 : in std_logic;
	KEY1 : in std_logic;
	KEY2 : in std_logic;
	KEY3 : in std_logic;
	clk			: in std_logic;
	reset			: in std_logic;
	pulse_len	: out std_logic_vector(2 downto 0));
end component;

component input_buffer is
	port (d0, d1, d2, d3, d4, clk, reset: in std_logic; q0, q1, q2, q3, q4 : out std_logic);
end component input_buffer;

signal pulse_len : std_logic_vector(2 downto 0);
signal s1, s2	: std_logic_vector (4 downto 0);


begin
	
	process(s2, pulse_len, SW1)
	begin
		if s2(0) = '0' then 
			if s2(1) = '1' then
				if pulse_len = "001" then
					notes_OUT  <= "00001"; --C1 short 
				elsif pulse_len = "010" then 
					notes_OUT  <= "00010"; --C1 mid
				elsif pulse_len = "100" then
					notes_OUT  <= "00011"; --C1 long
				else
					notes_OUT  <= "00100";
				end if;
			elsif s2(2) = '1' then
				if pulse_len = "001" then
					notes_OUT  <= "00101"; --D short
				elsif pulse_len = "010" then
					notes_OUT  <= "00110"; --D mid
				elsif pulse_len = "100" then
					notes_OUT  <= "00111"; --D long
				else
					notes_OUT  <= "00100";
				end if;
			elsif s2(3) = '1' then
				if pulse_len = "001" then
					notes_OUT  <= "01001"; --E short
				elsif pulse_len = "010" then
					notes_OUT  <= "01010"; --E mid
				elsif pulse_len = "100" then
					notes_OUT  <= "01011"; --E long
				else
					notes_OUT  <= "00100";
				end if;
			elsif s2(4) = '1' then
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
			if s2(1) = '1' then
				if pulse_len = "001" then
					notes_OUT  <= "10001"; --G short
				elsif pulse_len = "010" then
					notes_OUT  <= "10010"; --G mid
				elsif pulse_len = "100" then
					notes_OUT  <= "10011"; --G long
				else
					notes_OUT  <= "00100";
				end if;
			elsif s2(2) = '1' then
				if pulse_len = "001" then
					notes_OUT  <= "10101"; --A short
				elsif pulse_len = "010" then
					notes_OUT  <= "10110"; --A mid
				elsif pulse_len = "100" then
					notes_OUT  <= "10111"; --A long
				else
					notes_OUT  <= "00100";
				end if;
			elsif s2(3) = '1' then
				if pulse_len = "001" then
					notes_OUT  <= "11001"; --B short
				elsif pulse_len = "010" then
					notes_OUT  <= "11010"; --B mid
				elsif pulse_len = "100" then
					notes_OUT  <= "11011"; --B long
				else
					notes_OUT  <= "00100";
				end if;
			elsif s2(4) = '1' then
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
			if s2(1) = '1' then
				notes_OUT  <= "00000";  --stop bit
			end if;
		end if;
	end process;

pulse_length1: pulse_length port map(KEY0=>KEY0,KEY1=>KEY1,KEY2=>KEY2,KEY3=>KEY3,clk=>clk,reset=>reset,pulse_len=>pulse_len);

buf1: input_buffer port map(SW0, KEY0, KEY1, KEY2, KEY3, clk, reset,
			s1(0), s1(1), s1(2), s1(3), s1(4));
buf2: input_buffer port map(s1(0), s1(1), s1(2), s1(3), s1(4), clk, reset,
			s2(0), s2(1), s2(2), s2(3), s2(4));

end architecture;
