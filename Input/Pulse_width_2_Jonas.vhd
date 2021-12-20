library IEEE;
use IEEE.std_logic_1164.ALL;
use ieee.numeric_std.all;

entity pulse_length is
	 port(
		clk         	: in  std_logic;
		reset        	: in  std_logic;
		input_s		: in std_logic;
		pulse_len	: out std_logic_vector(2 downto 0)
	);
end pulse_length;

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
                new_count <= std_logic_vector(unsigned(count) + 1);
                if input_s = '0' then
                    new_state <= state_s0;
			if rising_edge(clk) then
     			   if count = "000101111101011110000100000" then --short 
          			  pulse_len <= "001";
       			   elsif count = "001011111010111100001000000" then --middel
            			  pulse_len <= "010";
        		   elsif count = "010111110101111000010000000" then --long
            			  pulse_len <= "100";
        		   end if;
			end if;
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
end behaviour;
