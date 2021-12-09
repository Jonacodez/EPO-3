
library IEEE;
use IEEE.std_logic_1164.ALL;

entity com_com is
port	(ard_in	: in std_logic_vector(4 downto 0);
	confirm : in std_logic;
	mat_in  : in std_logic_vector(2 downto 0);
	succes	: in std_logic;
	clk	: in std_logic;
	reset	: in std_logic;
	end_bit : in std_logic;
	arr_out : out std_logic_vector(4 downto 0);
	song_sel : out std_logic_vector(2 downto 0);
	handshake : out std_logic;
	shift	: out std_logic);
end entity;

architecture behv of com_com is

component com_timebase is
port	(clk	: in std_logic;
	reset	: in std_logic;
	clk2	: out std_logic);
end component;

type states is (loading, shifting1, shifting2, sel_state, sel_state_wate, res_state);
signal state: states; 
signal new_state: states:= sel_state;
signal a_in, a_out: std_logic_vector(4 downto 0);
signal con_d: std_logic;
signal ss: std_logic_vector(2 downto 0);
signal sh, nclk, res_tb, suc: std_logic;

begin

l1: com_timebase port map (clk, res_tb, nclk);

	stijger: process(clk)
	begin
	if reset = '1' then 
		state <= res_state;
	else
		if rising_edge(clk) then
			state <= new_state;
		end if;
	end if;
	end process;
	
	fsm: process(clk)
	begin
	if rising_edge(clk) then
		case state is
			when res_state => 
				res_tb <= '1';
				ss <= "000";
				if reset = '0' then new_state <= sel_state;
				end if;
			when sel_state =>
				ss <= mat_in;
				if mat_in = "000" then
					new_state <= state;
				else
					new_state <= sel_state_wate;
				end if;
			when sel_state_wate =>
				con_d <= confirm;
				if con_d /= confirm then
					new_state <= loading;
				end if;
			when loading => 
				res_tb <= '0';
				sh <= '0';
				con_d <= confirm;
				if con_d /= confirm then
					a_out <= a_in;
					sh <= '1';
				end if;
				if a_in = "00000" then
					new_state <= shifting1;
				end if;
			when shifting1 =>
				res_tb <= '1';
				sh <= '0';
				if suc = '1' then
					sh <= '1';
					new_state <= shifting2;
				elsif end_bit = '1' then
					new_state <= sel_state_wate;
				else
					new_state <= state;
				end if;
			when shifting2 =>
				new_state <= shifting1;
				
		end case;
	end if;
	end process;

suc <= succes;
a_in <= ard_in;
arr_out <= a_out;
song_sel <= ss;
shift <= sh;
handshake <= nclk;

end behv;

