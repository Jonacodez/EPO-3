library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behv of com_com is

component com_timebase is
port	(clk	: in std_logic;
	reset	: in std_logic;
	clk2	: out std_logic);
end component;

type states is (loading, shifting1, shifting2, sel_state, sel_state_wate, res_state);
signal state: states; 
signal new_state: states;
signal a_in, a_out, a_out_new: std_logic_vector(4 downto 0);
signal con_d: std_logic;
signal ss, ss_new: std_logic_vector(2 downto 0);
signal sh, res_tb, suc: std_logic;

begin

l1: com_timebase port map (clk, res_tb, handshake);

	stijger: process(clk)
	begin
	if reset = '1' then 
		state <= res_state;
	else
		if rising_edge(clk) then
			state <= new_state;
			ss <= ss_new;
			a_out <= a_out_new;
		end if;
	end if;
	end process;
	
	fsm: process(clk)
	begin
	if rising_edge(clk) then
		case state is
			when res_state => 
				res_tb <= '1';
				sh <= '0';
				ss_new <= "000";
				a_out_new <= "00000";
				if reset = '0' then 
					new_state <= sel_state;
				else
					new_state <= sel_state_wate;
				end if;
			when sel_state =>
				a_out_new <= "00000";
				ss_new <= mat_in;
				sh <= '0';
				if mat_in = "000" then
					new_state <= state;
				else
					new_state <= sel_state_wate;
				end if;
			when sel_state_wate =>
				a_out_new <= "00000";
				ss_new <= mat_in;
				sh <= '0';
				con_d <= confirm;
				if con_d /= confirm then
					new_state <= loading;
				else new_state <= state;
				end if;
			when loading => 
				res_tb <= '0';
				ss_new <= ss;
				sh <= '0';
				con_d <= confirm;
				if con_d /= confirm then
					a_out_new <= a_in;
					sh <= '1';
				else
					a_out_new <= a_out;
				end if;
				if a_in = "00000" then
					new_state <= shifting1;
				else new_state <= state;
				end if;
			when shifting1 =>
				res_tb <= '1';
				ss_new <= ss;
				sh <= '0';
				a_out_new <= a_out;
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
				ss_new <= ss;
				sh <= '1';
				a_out_new <= a_out;
				
		end case;
	end if;
	end process;

suc <= succes;
a_in <= ard_in;
arr_out <= a_out;
song_sel <= ss;
shift <= sh;

end behv;
