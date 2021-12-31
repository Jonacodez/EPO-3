library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of com_com is

component com_timebase is
port	(clk	: in std_logic;
	reset	: in std_logic;
	clk2	: out std_logic);
end component;

type states is (loading, shifting1, shifting2, sel_state, load_state_wate, res_state);
signal state: states; 
signal new_state: states;
signal a_out, a_out_new: std_logic_vector(4 downto 0);
signal con_d: std_logic;
signal ss, ss_new: std_logic_vector(2 downto 0);
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
			ss <= ss_new;
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
				ss_new <= "000";
				a_out_new <= "00000";
				if reset = '0' then 
					new_state <= sel_state;
				else
					new_state <= state;
				end if;
			when sel_state =>
				a_out_new <= "00000";
				ss_new <= mat_in;
				shift <= '0';
				if mat_in = "000" then
					new_state <= state;
				else
					new_state <= load_state_wate;
				end if;
			when load_state_wate =>
				res_tb <= '0';
				ss_new <= mat_in;
				shift <= '0';
				if con_d /= confirm then
					new_state <= loading;
				else
					a_out_new <= a_out;
					new_state <= state;
				end if;
			when loading =>
				shift <= '1';
				a_out_new <= ard_in;
				if ard_in = "00000" then
					new_state <= shifting1;
				else 
					new_state <= load_state_wate;
				end if;
				ss_new <= mat_in;
				res_tb <= '0';
			when shifting1 =>
				res_tb <= '1';
				ss_new <= ss;
				a_out_new <= a_out;
				if succes = '1' then
					shift <= '1';
					new_state <= shifting2;
				elsif end_bit = '1' then
					new_state <= sel_state;
					shift <= '0';
				else
					new_state <= state;
					shift <= '0';
				end if;
			when shifting2 =>
				new_state <= shifting1;
				ss_new <= ss;
				shift <= '0';
				a_out_new <= a_out;
		end case;
	end process;

arr_out <= a_out_new;
song_sel <= ss;
end behaviour;

