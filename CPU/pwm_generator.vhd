library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL; 

entity pwm_generator is
port (  clk 	: in std_logic;
  	reset 	: in std_logic;
	note	: in std_logic;
	count	: in std_logic_vector ( 19 downto 0);
	pwm  	: out std_logic
);
end pwm_generator;
 
architecture behavioural of pwm_generator is
type statetype is ( note_state, note_s, note_c, note_j, note_d, note_k, note_e, note_f, note_g, rest);
signal next_state, state : statetype; 

begin 
	process(clk)
	begin
		if(rising_edge(clk)) then
			if (reset = '1') then
				state <= rest;
			else
				state <= next_state;
			end if;
		end if;
	end process;


	process(state, count)
	begin
	case state is 
		when rest=> 
			pwm <='0';
			if(reset = '1') then 
				next_state<= rest;
			else 
				next_state<= note_state;
			end if;
		
		when note_state=> 
			if (note = 's') then -- de note gaat nog gekoppeld worden aan de note_out van de cpu
				next_state <= note_s;
			elsif (note = 'c') then 
				next_state <= note_c; 
			elsif (note = 'j') then 
				next_state <= note_j;
			elsif (note = 'd') then 
				next_state <= note_d;
			elsif (note = 'k') then 
				next_state <= note_k;
			elsif (note = 'e') then 
				next_state <= note_e;
			elsif (note = 'f') then 
				next_state <= note_f;
			else (note = 'g') then 
				next_state <= note_g;
			end if;

		when note_s =>
			pwm <='1';
				if (reset = '0') then
					if (unsigned(count)>100000) then  --bij alle unsigned voor nu zo gelaten omdat de note frequenties niet duidelijk zijn voor nu 
							next_state <= rest;
						end if;
				else 
					next_state <= rest;
				end if;

		when note_c =>
			pwm <='1';
				if (reset = '0') then
					if (unsigned(count)>100000) then  
							next_state <= rest;
						end if;
				else 
					next_state <= rest;
				end if;
		when note_j =>
			pwm <='1';
				if (reset = '0') then
					if (unsigned(count)>100000) then  
							next_state <= rest;
						end if;
				else 
					next_state <= rest;
				end if;
		when note_d =>
			pwm <='1';
				if (reset = '0') then
					if (unsigned(count)>100000) then  
							next_state <= rest;
						end if;
				else 
					next_state <= rest;
				end if;
		when note_k =>
			pwm <='1';
				if (reset = '0') then
					if (unsigned(count)>100000) then  
							next_state <= rest;
						end if;
				else 
					next_state <= rest;
				end if;
		when note_e =>
			pwm <='1';
				if (reset = '0') then
					if (unsigned(count)>100000) then  
							next_state <= rest;
						end if;
				else 
					next_state <= rest;
				end if;
		when note_f =>
			pwm <='1';
				if (reset = '0') then
					if (unsigned(count)>100000) then  
							next_state <= rest;
						end if;
				else 
					next_state <= rest;
				end if;
		when note_g =>
			pwm <='1';
				if (reset = '0') then
					if (unsigned(count)>100000) then  
							next_state <= rest;
						end if;
				else 
					next_state <= rest;
				end if;
		end case;
	end process;
end architecture behavioural;
