library IEEE;
use IEEE.std_logic_1164.ALL;
architecture behaviour of com_com is

component com_timebase is
port	(clk	: in std_logic;
	reset	: in std_logic;
	clk2	: out std_logic);
end component;

type states is (loading, shifting1, shifting2, sel_state, load_state_wate, res_state, filter_state);
signal state: states; 
signal new_state: states;
signal a_out, a_out_new: std_logic_vector(4 downto 0);
signal con_d: std_logic;
signal ss: std_logic_vector(2 downto 0);
signal res_tb: std_logic;

begin

l1: com_timebase port map (clk, res_tb, handshake);

	stijger: process(clk, reset)
	begin
	if rising_edge(clk) then
		if reset = '1' then 
			state <= res_state;
		else
			state <= new_state;
			a_out <= a_out_new;
			con_d <= confirm;
		end if;
	end if;
	end process;
	
	fsm: process(state, reset, mat_in, confirm, ard_in, succes, end_bit, a_out, ss, con_d)
	begin

		case state is
			when res_state => 
				res_tb <= '1';
				shift <= '0';
				shift2 <= '0';
				ss <= "000";
				a_out_new <= "00000";
				if reset = '0' then 
					new_state <= sel_state;
				else
					new_state <= state;
				end if;
			when sel_state =>
				a_out_new <= "00000";
				ss <= mat_in;
				shift <= '0';
				shift2 <= '0';
				res_tb <= '0';
				if mat_in = "000" then
					new_state <= state;
				else
					new_state <= load_state_wate;
				end if;
			when load_state_wate =>
				res_tb <= '0';
				ss <= mat_in;
				shift <= '0';
				shift2 <= '0';
				a_out_new <= a_out;
				if con_d /= confirm then
					new_state <= loading;
				else
					new_state <= state;
				end if;
			when loading =>
				shift <= '1';
				shift2 <= '0';
				a_out_new <= ard_in;
				ss <= mat_in;
				res_tb <= '0';
				if ard_in = "00000" then
					new_state <= filter_state;
				else 
					new_state <= load_state_wate;
				end if;
			when filter_state =>
				shift <= '0';
				ss <= "000";
				a_out_new <= a_out;
				res_tb <= '1';
				if end_bit = '1' then
					new_state <= shifting1;
					shift2 <= '1';
				else 
					new_state <= state;
					shift2 <= '0';
				end if;				
			when shifting1 =>
				res_tb <= '1';
				shift <= '0';
				shift2 <= '0';
				ss <= "000";
				a_out_new <= a_out;
				if succes = '1' then
					new_state <= shifting2;
				elsif end_bit = '1' then
					new_state <= sel_state;
				else
					new_state <= state;
				end if;
			when shifting2 =>
				res_tb <= '1';
				new_state <= shifting1;
				ss <= "000";
				shift <= '1';
				shift2 <= '1';
				a_out_new <= a_out;
		end case;
	end process;

arr_out <= a_out_new;
song_sel <= ss;
end behaviour;
