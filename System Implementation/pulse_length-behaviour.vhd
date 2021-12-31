library IEEE;
use IEEE.std_logic_1164.ALL;
use ieee.numeric_std.all;

architecture behaviour of pulse_length is


type state_type is (res_state,state_s0,state_s1,state_s11);
signal state			:state_type;
signal new_state 					:state_type;
signal count , new_count  : std_logic_vector(26 downto 0);
signal pulse            : std_logic_vector(26 downto 0);


begin


    process(clk, reset)
    begin  
	if rising_edge(clk) then  
        		if reset = '1' then
            		state <= res_state;
			 count <= (others => '0');
        		else
            		state <= new_state;
			  count <= new_count;
        		end if;
	end if;
    end process;

   process(input_s, count, state)
    begin
		  pulse <= (others => '0');
		case state is
            when res_state =>

                new_count <= (others => '0');
                if input_s = '1' then
                    new_state <= state_s0;
                elsif input_s = '0' then
                    new_state <= state_s1;
                else
                    new_state <= res_state;
                end if;
            
            when state_s0 =>
                new_count <= std_logic_vector(unsigned(count) + 1);
                if input_s = '1' then
                    new_state <= state_s0;
                elsif input_s = '0' then
                    new_state <= state_s1;
                else
                    new_state <= state_s0;
                end if;

            when state_s1 =>
                pulse <= new_count;
				new_count <= count;
				new_state <= state_s11;

            when state_s11 =>
                new_count <= (others => '0');
                if input_s = '1' then
                    new_state <= state_s0;
                elsif input_s = '0' then
                    new_state <= state_s1;
                else
                    new_state <= state_s1;
                end if;
	end case;
    end process;

process (pulse)
begin

        if (pulse >= "000000100110001001011010000" and pulse <= "000101111101011110000100000") then --0.5 s, (0.125 s) - (0.05 s)
            pulse_len <= "001";
        elsif (pulse >= "000101111101011110000100000" and pulse <= "001011111010111100001000000" ) then --0.5 and 1.0 s 
            pulse_len <= "010";
        elsif (pulse <= "010111110101111000010000000" and pulse >= "000101111101011110000100000" )then --1.0 and 2.0 s
            pulse_len <= "100";
        else
            pulse_len <= "000";
        end if;

end process;    
end behaviour;
