library IEEE;
use IEEE.std_logic_1164.ALL;
use ieee.numeric_std.all;

architecture behaviour of pulse_length is

component detect_input port(   
	KEY0 : in std_logic;
	KEY1 : in std_logic;
	KEY2 : in std_logic;
	KEY3 : in std_logic;
	input_d : out std_logic
     );
end component;

type state_type is (res_state,state_s0,state_s1,state_s11);
signal state			:state_type;
signal new_state 					:state_type;
signal count , new_count  : std_logic_vector(26 downto 0);
signal pulse            : std_logic_vector(26 downto 0);
signal input_s		:std_logic;

begin
u2: detect_input port map(KEY0=>KEY0,KEY1=>KEY1,KEY2=>KEY2,KEY3=>KEY3,input_d => input_s);

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
                elsif input_s = '1' then
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
                if input_s = '0' then
                    new_state <= state_s0;
                elsif input_s = '1' then
                    new_state <= state_s1;
                else
                    new_state <= state_s1;
                end if;
	end case;
    end process;

process (pulse)
begin

        if pulse >= "00100111101100" then
            pulse_len <= "001";
        elsif pulse >= "01001111011000" then
            pulse_len <= "010";
        elsif pulse >= "10011110110000" then
            pulse_len <= "100";
        else
            pulse_len <= "000";
        end if;

end process;    
end behaviour;
