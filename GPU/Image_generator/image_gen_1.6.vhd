library ieee;
use ieee.std_logic_1164.all;

entity image_gen_2 is
	port(	pixel_clk, reset	:	in std_logic;
		Hcount, Vcount		:	in integer;
		display_enable		:	in std_logic;
		data_in			:	in std_logic_vector(4 downto 0);
		r_out, g_out, b_out	:	out std_logic
		--r, g, b			:	out std_logic
		);
end image_gen_2;

architecture generator of image_gen_2 is
	
	constant h1: integer:= 96; --hpulse
	constant h2: integer:= 144; --border
	constant h3: integer:= 784; --border
	constant h4: integer:= 800; --hfrontport
	constant v1: integer:= 2; --vpulse
	constant v2: integer:= 35; --border
	constant v3: integer:= 515; --border
	constant v4: integer:= 525; --vfrontport
	constant size: integer:= 50;
	constant block_top: integer:= v2;
	constant block_bottom: integer:= v2 + size;

	signal shift : integer:= 0;

							

begin
	p0: process(pixel_clk, reset)
	begin
	if(reset = '0') then
		if(display_enable = '1') then
			if( Vcount >= block_top + shift and Vcount <= block_bottom + shift) then
				r_out <= '1';
				g_out <= '0';
				b_out <= '0';
			else
				r_out <= '0';
				g_out <= '0';
				b_out <= '0';
			end if;
		end if;
	elsif(reset = '1') then
		r_out <= '1';
		g_out <= '1';
		b_out <= '0';
	end if;
	end process;

	shift_count: process(Vcount)
	begin
		if(Vcount = 30) then
			shift <= shift + 10;
		end if;
	end process;
		
end architecture generator;
