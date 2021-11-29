library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity pulse_length is
port (
  clk                   : in  std_logic;
  reset                 : in  std_logic;
  input_s		: in std_logic;
  pulse_len		: out std_logic_vector(2 downto 0));
end pulse_length;	

architecture behaviour of pulse_length is
constant MAX_COUNT           : unsigned(7 downto 0):=(others=>'1');
signal count_lo              : unsigned(7 downto 0);
signal count_lo_ena          : std_logic;
signal rise                  : std_logic;
signal fall                  : std_logic;
signal input                 : std_logic_vector(0 to 3); 
signal pulse                 : std_logic_vector(7 downto 0);

begin
edge_detector : process(clk,reset)
begin
  if(reset='0') then
    rise       <= '0';
    fall       <= '0';
    input      <= (others=>'0');
  elsif(rising_edge(clk)) then
    rise       <= not input(2) and input(1);
    fall       <= not input(1) and input(2);
    input      <= input_s&input(0 to input'length-2);
  end if;
end process edge_detector;

process(clk,reset)
begin
  if(reset='0') then
    count_lo_ena  <= '0';
    count_lo      <= to_unsigned(1,8);
    pulse  <= (others=>'0');
  elsif(rising_edge(clk)) then
    if(fall='1') then
      count_lo_ena  <= '1';
    elsif(rise='1') then
      count_lo_ena  <= '0';
      pulse  <= std_logic_vector(count_lo);
    end if;
    if(count_lo_ena='1') then
      if(count_lo<MAX_COUNT) then
        count_lo <= count_lo + 1;
      end if;
    else
      count_lo <= to_unsigned(1,8);
    end if;
  end if;
end process;
process (clk)
begin
	if pulse >= "00011011" then
		pulse_len <= "001";
	elsif pulse >= "00110111" then
		pulse_len <= "010";
	elsif pulse >= "111111111" then
		pulse_len <= "100";
	end if;
end process;	
end behaviour;
