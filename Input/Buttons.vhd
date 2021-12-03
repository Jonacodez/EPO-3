library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity buttons is
port(   
	KEY0 : in std_logic;
	KEY1 : in std_logic;
	KEY2 : in std_logic;
	KEY3 : in std_logic;
	SW0  : in std_logic;
	SW1  : in std_logic;
	notes_OUT : out std_logic_vector(4 downto 0)
     );
end buttons;

architecture behaviour of buttons is

component pulse_length port(
	clk         	: in  std_logic;
	reset        	: in  std_logic;
	input_s		: in std_logic;
	pulse_len	: out std_logic_vector(2 downto 0));
end component;

signal input 	 : std_logic;
signal pulse_len : std_logic_vector(2 downto 0);
begin
	u1: pulse_length port map(clk=>'0',reset=>'0',input_s=>'0',pulse_len=>pulse_len);
	process(SW0)
	begin
		if SW0 = '0' then
			if KEY0 = '1' then
				if pulse_len = "001" then
					notes_OUT <= "00001";
				elsif pulse_len = "010" then
					notes_OUT <= "00010";
				elsif pulse_len = "100" then
					notes_OUT <= "00011";
				end if;
			elsif KEY1 = '1' then
				if pulse_len = "001" then
					notes_OUT <= "00100";
				elsif pulse_len = "010" then
					notes_OUT <= "00101";
				elsif pulse_len = "100" then
					notes_OUT <= "00110";
				end if;
			elsif KEY2 = '1' then
				if pulse_len = "001" then
					notes_OUT <= "00111";
				elsif pulse_len = "010" then
					notes_OUT <= "01000";
				elsif pulse_len = "100" then
					notes_OUT <= "01001";
				end if;
			elsif KEY3 = '1' then
				if pulse_len = "001" then
					notes_OUT <= "01010";
				elsif pulse_len = "010" then
					notes_OUT <= "01011";
				elsif pulse_len = "100" then
					notes_OUT <= "01100";
				end if;
			end if;
		elsif SW0 = '1' then
			if KEY0 = '1' then
				if pulse_len = "001" then
					notes_OUT <= "01101";
				elsif pulse_len = "010" then
					notes_OUT <= "01110";
				elsif pulse_len = "100" then
					notes_OUT <= "01111";
				end if;
			elsif KEY1 = '1' then
				if pulse_len = "001" then
					notes_OUT <= "10000";
				elsif pulse_len = "010" then
					notes_OUT <= "10001";
				elsif pulse_len = "100" then
					notes_OUT <= "10010";
				end if;
			elsif KEY2 = '1' then
				if pulse_len = "001" then
					notes_OUT <= "10011";
				elsif pulse_len = "010" then
					notes_OUT <= "10100";
				elsif pulse_len = "100" then
					notes_OUT <= "10101";
				end if;
			elsif KEY3 = '1' then
				if pulse_len = "001" then
					notes_OUT <= "10110";
				elsif pulse_len = "010" then
					notes_OUT <= "10111";
				elsif pulse_len = "100" then
					notes_OUT <= "11000";
				end if;
			end if;
		end if;
		if SW1 = '1' then
			notes_OUT <= "00000";
		end if;
	end process;
end architecture;
