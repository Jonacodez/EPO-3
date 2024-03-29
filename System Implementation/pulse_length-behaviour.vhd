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

   process(input_p, count, state)
    begin
		  pulse <= (others => '0');
		case state is
            when res_state =>

                new_count <= (others => '0');
                if input_p = '1' then
                    new_state <= state_s0;
                elsif input_p = '0' then
                    new_state <= state_s1;
                else
                    new_state <= res_state;
                end if;
            
            when state_s0 =>
                new_count <= std_logic_vector(unsigned(count) + 1);
                if input_p = '1' then
                    new_state <= state_s0;
                elsif input_p = '0' then
                    new_state <= state_s1;
                else
                    new_state <= state_s0;
                end if;

            when state_s1 =>
                pulse <= count;
				new_count <= count;
				new_state <= state_s11;

            when state_s11 =>
                new_count <= (others => '0');
                if input_p = '1' then
                    new_state <= state_s0;
                elsif input_p = '0' then
                    new_state <= state_s1;
                else
                    new_state <= state_s1;
                end if;
	end case;
   end process;

process (pulse)
begin

        if (pulse >= "000000100110001001011010000" and pulse <= "000100010010101010001000000") then --0.05 and 0.36
            pulse_len <= "001";
        elsif (pulse >= "000100010010101010001000000" and pulse <= "001000100101010100010000000" ) then --0.36 and 0.72 s 
            pulse_len <= "010";
        elsif (pulse <= "001000100101010100010000000" and pulse >= "010000101100000111011000000" )then --0.72 and 1.4s
            pulse_len <= "100";
        else
            pulse_len <= "000";
        end if;
end process;    

end behaviour;
