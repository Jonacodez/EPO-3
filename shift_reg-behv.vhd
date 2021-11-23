library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behv of shift_reg is

    constant sr_depth : integer := 9;
    constant sr_width : integer := 5;
    signal o0, o1, o2, o3, o4, o5, o6, o7: std_logic_vector(sr_width - 1 downto 0);

    type sr_type is array (sr_depth - 2 downto 0)
    of std_logic_vector(sr_width - 1 downto 0);
    type boolean is (false,true);
    signal mode : boolean := false;
    signal sr : sr_type;

begin
    
    process(input, clk, shift)
    begin

	-- everything happens upon the clock changing
	if rising_edge(clk) then
	    if mode = false then
		if shift = '1' then
		    sr <= sr(sr'high - 1 downto sr'low) & input;
		    if sr(sr'low) = "00000" then
			mode <= true;
		    end if;
		end if;
	    else 
		o7 <= sr(sr'high);
		o6 <= sr(sr'high - 1);
		o5 <= sr(sr'high - 2);
		o4 <= sr(sr'high - 3);
		o3 <= sr(sr'high - 4);
		o2 <= sr(sr'high - 5);
		o1 <= sr(sr'high - 6);
		o0 <= sr(sr'high - 7);
		if shift = '1' then
       		    sr <= sr(sr'high - 1 downto sr'low) & "00000";
		    if sr(sr'high) = "00000" then
			mode <= false;
		    end if;
		end if;
	    end if;
	end if;

    end process;
	
    output0 <= o0;
    output1 <= o1;
    output2 <= o2;
    output3 <= o3;
    output4 <= o4;
    output5 <= o5;
    output6 <= o6;
    output7 <= o7;


end behv;

