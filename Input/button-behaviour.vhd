library IEEE;
use IEEE.std_logic_1164.ALL;

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


signal pulse_len : std_logic_vector(2 downto 0);
begin
u1: pulse_length port map(KEY0=>KEY0,KEY1=>KEY1,KEY2=>KEY2,KEY3=>KEY3,clk=>'0',reset=>'0',pulse_len=>pulse_len);
	process(SW0,KEY0,KEY1,KEY2,KEY3,SW1)
	begin
if SW1 = '1' then
				notes_OUT <= "00000";
else
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
			else
					notes_OUT <= "00000";
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
			else
					notes_OUT <= "00000";
			end if;
		end if;
		
			end if;
	end process;
end architecture;


