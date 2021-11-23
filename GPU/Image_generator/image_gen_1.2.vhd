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
	
	P0: process(pixel_clk) --statisch raster maken
	begin
		if(dena = '1') then
 			if(Vcount = 480) then 
				r <= '1';
				g <= '1';
				b <= '1';
			end if;
		end if;
	end process;

	process(pixel_clk) --triggers van de state bepalen
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
