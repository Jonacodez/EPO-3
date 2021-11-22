library ieee ;
use ieee.std_logic_1164.all;

---------------------------------------------------

entity shift_reg is
port(	input:		in std_logic_vector(4 downto 0);
	clk:		in std_logic;
	shift:		in std_logic;
	output0, output1, output2, output3, ouput4, output5, output6, output7: out std_logic_vector(4 downto 0);
);
end shift_reg;

---------------------------------------------------

architecture behv of shift_reg is

    constant sr_depth : integer 32;
    constant sr_width : integer 5;
    constant mode     : boolean 0;
    signal o0, o1, o2, o3, o4, o5, o6, o7: std_logic_vector(sr_width - 1 downto 0);

    type sr_type is array (sr_depth - 2 downto 0)
    of std_logic_vector(sr_width - 1 downto 0);
    signal sr : sr_type;

begin
    
    process(input, clk, shift, sr)
    begin

	-- everything happens upon the clock changing
	if clk='1' then
	    if mode = 0; then
		if shift = '1' then
		    sr <= sr(sr'high - 1 downto sr'low) & input;
 		    o0 <= sr(sr'low);
		    if sr'low = "00000" then
			mode <= 1;
		    end if;
		end if
	    else
 
       		sr <= sr(sr'high - 1 downto sr'low) & input;
 		o0 <= sr(sr'low);
	
	end if;

    end process;
	
    -- concurrent assignment
    Q <= S(0);

end behv;
