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
	
	type states is (res_state, loading1, loading2, shifting);
    	type sr_type is array (sr_depth - 2 downto 0)
    	of std_logic_vector(sr_width - 1 downto 0);
	signal sr: sr_type;
	signal state, new_state: states;

begin

process(clk)
begin
if rising_edge(clk) then
	if reset = '1' then
		state <= res_state;
	else 
		state <= new_state;
	end if;
end if;	
end process;

process(clk)
begin
	if rising_edge(clk) then
		case state is
			when res_state =>
				end_bit <= '0';
       		    		sr <= sr(sr'high - 1 downto sr'low) & "00000";
				if reset = '0' then
					new_state <= loading1;
				end if;
			when loading1 =>
				end_bit <= '0';
				if shift = '1' then
					sr <= sr(sr'high - 1 downto sr'low) & input;
					new_state <= loading2;
				end if;
			when loading2 =>
				end_bit <= '0';
				if shift = '1' then
					sr <= sr(sr'high - 1 downto sr'low) & input;
					if sr(sr'low) = "00000" then 
						new_state <= shifting;
					end if;
				end if;
			when shifting =>
				end_bit <= '0';
				if sr(sr'high) = "00000" then
					new_state <= loading1;
					end_bit <= '1';
				else 
					if shift = '1' then
						sr <= sr(sr'high - 1 downto sr'low) & "00000";
					end if;
				end if;
		end case;
	end if;
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
