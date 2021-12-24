library IEEE;
use IEEE.std_logic_1164.ALL;

entity shift_reg is
port(	input:		in std_logic_vector(4 downto 0);
	clk:		in std_logic;
	shift:		in std_logic;
	reset:		in std_logic;
	output0, output1, output2, output3, output4, output5, output6, output7: out std_logic_vector(4 downto 0);
	end_bit:	out std_logic
);
end shift_reg;

architecture behv of shift_reg is
	constant sr_depth : integer := 9;
    	constant sr_width : integer := 5;
	
	type states is (res_state, loading2, shifting1, shifting2);
    	type sr_type is array (sr_depth - 2 downto 0)
    	of std_logic_vector(sr_width - 1 downto 0);
	signal sr, sr_new: sr_type;
	signal state, new_state: states;

begin

process(clk)
begin
if rising_edge(clk) then
	sr <= sr_new;
	if reset = '1' then
		state <= res_state;
	else 
		state <= new_state;
	end if;
end if;	
end process;

process(state, input, reset, shift)
begin
		case state is
			when res_state =>
				end_bit <= '0';
       		    		sr_new <= (others => "00000");
				if reset = '0' then
					new_state <= loading2;
				else new_state <= res_state;
				end if;
			when loading2 =>
				end_bit <= '0';
				if shift = '1' then
					sr_new <= sr(sr'high - 1 downto sr'low) & input;
					if input = "00000" then 
						new_state <= shifting1;
					else 
						new_state <= loading2;
					end if;
				else new_state <= loading2;
					sr_new <= sr;
				end if;
			when shifting1 =>
				end_bit <= '0';
				new_state <= shifting2;
				sr_new <= sr;
			when shifting2 =>
				end_bit <= '0';
				if sr(sr'high) = "00000" then
					new_state <= loading2;
					end_bit <= '1';
					sr_new <= sr;
				else
					new_state <= shifting2;
					if shift = '1' then
						sr_new <= sr(sr'high - 1 downto sr'low) & "00000";
					else sr_new <= sr;
					end if;
				end if;
		end case;
end process;

	output0 <= sr(sr'high);
    	output1 <= sr(sr'high - 1);
    	output2 <= sr(sr'high - 2);
    	output3 <= sr(sr'high - 3);
    	output4 <= sr(sr'high - 4);
    	output5 <= sr(sr'high - 5);
    	output6 <= sr(sr'high - 6);
    	output7 <= sr(sr'high - 7);

end behv;
