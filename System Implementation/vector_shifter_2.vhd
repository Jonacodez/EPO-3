library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.all;

entity shift_reg_2 is
port(	input0, input1, input2, input3, input4, input5, input6, input7:	in std_logic_vector(4 downto 0);
	clk:			in std_logic;
	succes:			in std_logic;
	succes_count:		in std_logic;
	reset:			in std_logic;
	output: 		out std_logic_vector(4 downto 0)
);
end shift_reg_2;

architecture behv of shift_reg_2 is
	constant sr_depth : integer := 8;
    	constant sr_width : integer := 5;
	
	type states is (res_state, loading0, loading1, loading2);
    	type sr_type is array (sr_depth - 2 downto 0)
    	of std_logic_vector(sr_width - 1 downto 0);
	signal sr, sr_new: sr_type;
	signal state, new_state: states;
	signal count, new_count: unsigned (2 downto 0);
	signal input: std_logic_vector (4 downto 0);

begin

process(clk)
begin
if rising_edge(clk) then
	if reset = '1' then
		state <= res_state;
	else 
		state <= new_state;
		sr <= sr_new;
		count <= new_count;
	end if;
end if;	
end process;

process(state, sr, input0, input1, input2, input3, input4, input5, input6, reset, succes, succes_count)
begin
		case state is
			when res_state => --reset state
       		    		sr <= (others => "00000");
				count <= (others => '0');
				if reset = '0' then
					new_state <= loading1;
				else new_state <= res_state;
				end if;
			when loading0 => --store the data from the main array while the first note hasn't reached green line.
				sr_new(0) <= input0;
				sr_new(1) <= input1;
				sr_new(2) <= input2;
				sr_new(3) <= input3;
				sr_new(4) <= input4;
				sr_new(5) <= input5;
				sr_new(6) <= input6;
				if succes_count = '1' then
					new_count <= count +1;
					new_state <= loading1;
				else 
					new_count <= count;
					new_state <= state;
				end if;
			when loading1 => --count amount of notes generated before first notes hit green line.
				if succes = '1' then 
					sr_new <= sr(sr'high - 1 downto sr'low) & input;
					new_state <= loading2;
					new_count <= count;
				else
					new_state <= state;
					sr_new <= sr;
					if succes_count = '1' then
						new_count <= count + 1;
					else 
						new_count <= count;
					end if;
				end if;
			when loading2 => --shift in the value that wasn't on list yet
				if sr(sr'high) = "00000" then 
					sr_new <= sr;
					new_state <= loading1;
					new_count <= (others => '0');
				else
					new_state <= state;
					new_count <= count;
					if succes = '1' then
						sr_new <= sr(sr'high - 1 downto sr'low) & input;
					else sr_new <= sr;
					end if;	
				end if;
		end case;
end process;

process(count, input1, input2, input3, input4, input5, input6, input7) --count how many notes are on the screen so that you can start adding new values.
begin	
	case count is
		when "000" => input <= input7;
		when "001" => input <= input6;
		when "010" => input <= input5;
		when "011" => input <= input4;
		when "100" => input <= input3;
		when "101" => input <= input2;
		when "110" => input <= input1;
		when others => input <= input7;
	end case;
end process;

output <= sr(sr'high);

end behv;