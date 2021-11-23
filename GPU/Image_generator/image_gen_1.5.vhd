library ieee;
use ieee.std_logic_1164.all;

entity image_gen is
	port(	pixel_clk, reset	:	in std_logic;
		Hcount, Vcount		:	in integer;
		Hactive, Vactive	:	in std_logic;
		data_in			:	in std_logic_vector(4 downto 0);
		r, g, b			:	out std_logic
		);
end image_gen;

architecture generator of image_gen is
	
	constant h1: integer:= 96; --hpulse
	constant h2: integer:= 144; --hpulse + hbackport
	constant h3: integer:= 784; --hpulse + hbackport + hactive
	constant h4: integer:= 800; --hpulse + hbackport + hactive + hfrontport
	constant v1: integer:= 2;
	constant v2: integer:= 35;
	constant v3: integer:= 515;
	constant v4: integer:= 525;

	type note_state is(
    			stop_state,
    			note_0,
			note_1,
			note_2,	
			note_3,
			note_4,
			note_5,
			note_6,
			note_7
			);
							
	signal	state, new_state:	note_state;
	signal dena		:	std_logic;    --display enable
	signal state_counter	:	integer :=0;
begin
	dena <= Hactive and Vactive;
	
	p0: 
	process(pixel_clk, dena) --statisch raster maken
	begin
		r <= '0';
		g <= '0';
		b <= '0';
		if(dena = '1') then
			--line 1
 			if	(Hcount >= h2+0 and Hcount <= h2+0+640 and Vcount > v2+0 and Vcount <= v2+0+2) or
			  	(Hcount >= h2+0 and Hcount <= h2+0+640 and Vcount > v2+2+57 and Vcount <= v2+2+57+2) or
				(Hcount >= h2+0 and Hcount <= h2+0+640 and Vcount > v2+2+57+2+58 and Vcount <= v2+2+57+2+58+2) or
				(Hcount >= h2+0 and Hcount <= h2+0+640 and Vcount > v2+2+57+2+58+2+58 and Vcount <= v2+2+57+2+58+2+58+2) or
				(Hcount >= h2+0 and Hcount <= h2+0+640 and Vcount > v2+2+57+2+58+2+58+2+58 and Vcount <= v2+2+57+2+58+2+58+2+58+2) or
				(Hcount >= h2+0 and Hcount <= h2+0+640 and Vcount > v2+2+57+2+58+2+58+2+58+2+58 and Vcount <=  v2+2+57+2+58+2+58+2+58+2+58+2) or
				(Hcount >= h2+0 and Hcount <= h2+0+640 and Vcount > v2+2+57+2+58+2+58+2+58+2+58+2+58 and Vcount <= v2+2+57+2+58+2+58+2+58+2+58+2+58+2) or
				(Hcount >= h2+0 and Hcount <= h2+0+640 and Vcount > v2+2+57+2+58+2+58+2+58+2+58+2+58+2+58 and Vcount <= v2+2+57+2+58+2+58+2+58+2+58+2+58+2+58+2) or
				(Hcount >= h2+0 and Hcount <= h2+0+640 and Vcount > v2+2+57+2+58+2+58+2+58+2+58+2+58+2+58+2+57 and Vcount <= v2+2+57+2+58+2+58+2+58+2+58+2+58+2+58+2+57+2)then 
				r <= '1';
				g <= '1';
				b <= '1';
			elsif (Vcount <=v2+2+57) then
				r <= '0';
				g <= '0';
				b <= '0';
			--line 2
			elsif (Vcount <=v2+2+57+2+58) then
				r <= '0';
				g <= '0';
				b <= '0';
			--line 3
			elsif (Vcount <=v2+2+57+2+58+2+58) then
				r <= '0';
				g <= '0';
				b <= '0';
			--line 4
			elsif (Vcount <=v2+2+57+2+58+2+58+2+58) then
				r <= '0';
				g <= '0';
				b <= '0';
			--line 5
			elsif (Vcount <=v2+2+57+2+58+2+58+2+58+2+58) then
				r <= '0';
				g <= '0';
				b <= '0';
			--line 6
			elsif (Vcount <=v2+2+57+2+58+2+58+2+58+2+58+2+58) then
				r <= '0';
				g <= '0';
				b <= '0';
			--line 7
			elsif (Vcount <=v2+2+57+2+58+2+58+2+58+2+58+2+58+2+58) then
				r <= '0';
				g <= '0';
				b <= '0';
			--line 8
			elsif (Vcount <=v2+2+57+2+58+2+58+2+58+2+58+2+58+2+58+2+57) then
				r <= '0';
				g <= '0';
				b <= '0';
			--line 9
			else 
				r <= '0';
				g <= '0';
				b <= '0';
			end if;
		end if;
	end process;

	p1: process(pixel_clk) --triggers van de state bepalen
	begin 
		if(reset = '0') then
            		if(pixel_clk'event and pixel_clk = '1') then
				state <= new_state;
			elsif(data_in = "00000") then
      				new_state <= stop_state;
    			elsif(data_in = "000--") then
      				new_state <= note_0;
   	 		elsif(data_in = "001--") then
      				new_state <= note_1;
   	 		elsif(data_in = "010--") then
      				new_state <= note_2;
   			elsif(data_in = "011--") then
    	  			new_state <= note_3;
   			elsif(data_in = "100--") then
      				new_state <= note_4;
    			elsif(data_in = "101--") then
      				new_state <= note_5;
   			elsif(data_in = "110--") then
      				new_state <= note_6;
    			elsif(data_in = "111--") then
      				new_state <= note_7;
			end if;
    			elsif(reset = '0') then
    				new_state <= stop_state;
   			end if;
      
  	end process;
	process(new_state, state) --output komt hier vandaan
	begin
    		if(dena = '1') then
		case state is
      	when stop_state =>
      		-- positie
      		-- kleur
	when note_0 =>
      	when note_1 =>
      		--positie
          --kleur
      	when note_2 =>
      		--positie
      		--kleur
      	when note_3 =>
      		--positie
      		--kleur
      	when note_4 =>
      		--positie
      		--kleur
        when note_5 =>
      		--positie
      		--kleur
      	when note_6 =>
      		--positie
      		--kleur
      	when note_7 =>
      		--positie
      		--kleur
      end case;
end if;
  end process;
end architecture generator;
