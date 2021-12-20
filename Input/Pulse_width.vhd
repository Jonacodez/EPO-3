library IEEE;
use IEEE.std_logic_1164.ALL;
use ieee.numeric_std.all;

architecture behaviour of pulse_length is

type state_type is (res_state,state_s0,state_s1,state_s11);
signal state			:state_type;
signal new_state 					:state_type;
signal count , new_count  : std_logic_vector(14 downto 0);
signal pulse            : std_logic_vector(14 downto 0);


begin

    process(clk, reset)
    begin  
	if rising_edge(clk) then  
        		if reset = '1' then
			  count <= (others => '0');
            		state <= res_state;
        		else
            		state <= new_state;
			  count <= new_count;
        		end if;
	end if;
    end process;

    process(clk,reset, input_s)
    begin
		case state is
            when res_state =>
                new_count <= (others => '0');
                pulse <= (others => '0');
                pulse_len <= "000";
                if input_s = '0' then
                    new_state <= state_s0;
                elsif input_s = '1' then
                    new_state <= state_s1;
                else
                    new_state <= res_state;
                end if;
            
            when state_s0 =>
                pulse_len <= "000";
                new_count <= std_logic_vector(unsigned(count) + 1);
                if input_s = '0' then
                    new_state <= state_s0;
                elsif input_s = '1' then
                    new_state <= state_s1;
                else
                    new_state <= state_s0;
                end if;

            when state_s1 =>
				pulse_len <= "000";
                pulse <= new_count;
				new_count <= count;
				if reset = '1' then
					new_state <= res_state;
				else
					new_state <= state_s11;
				end if;

            when state_s11 =>
				pulse_len <= "000";
                new_count <= (others => '0');
                if input_s = '0' then
                    new_state <= state_s0;
                elsif input_s = '1' then
                    new_state <= state_s1;
                else
                    new_state <= state_s1;
                end if;
	end case;
    end process;

process (clk)
begin
    if rising_edge(clk) then
        if pulse >= "00100111101100" then
            pulse_len <= "001";
        elsif pulse >= "01001111011000" then
            pulse_len <= "010";
        elsif pulse >= "10011110110000" then
            pulse_len <= "100";
        else
            pulse_len <= "000";
        end if;
    end if;
end process;    
end behaviour;
