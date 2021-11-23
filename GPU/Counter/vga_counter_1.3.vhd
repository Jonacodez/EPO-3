library ieee;
use ieee.std_logic_1164.all;

entity vga_counter is
	port(	reset			:	in std_logic;
		pixel_clk		:	in std_logic;
		Hsync, Vsync		:	buffer std_logic;
		Hactiveout, Vactiveout	:	out std_logic;
		Hcountout, Vcountout	:	out integer
		);
end vga_counter;

architecture behavioural of vga_counter is

	constant h1: integer:= 96; --hpulse
	constant h2: integer:= 144; --hpulse + hbackport
	constant h3: integer:= 784; --hpulse + hbackport + hactive
	constant h4: integer:= 800; --hpulse + hbackport + hactive + hfrontport
	constant v1: integer:= 2;
	constant v2: integer:= 35;
	constant v3: integer:= 515;
	constant v4: integer:= 525;

	signal Hactive, Vactive		:	std_logic;
	signal Vcount			:	positive range 1 to v4 + 1;
	signal Hcount			:	positive range 1 to h4 + 1;

begin
  
p0: process(reset, pixel_clk)
  begin
    	if(reset = '1') then
      		Hcount <= 1;
  		Hsync <= '0';
		Hactive <= '0';

	elsif(pixel_clk'event and pixel_clk = '1') then
		Hcount <= Hcount + 1;
		if(Hcount = h1) then
			Hsync <= '1';
		elsif(Hcount = h2) then
			Hactive <= '1';
		elsif(Hcount = h3) then
			Hactive <= '0';
		elsif(Hcount = h4) then
			Hsync <= '0';
			Hcount <= 1;
		end if;
	end if;
end process;

--Vsync signal generation
p2: process(reset, Hsync)
begin
	if(reset = '1') then
      		Vcount <= 1;
  		Vsync <= '0';
		Vactive <= '0';

	elsif(Hsync'event and Hsync = '1') then
		Vcount <= Vcount + 1;
		if(Vcount = v1) then
			Vsync <= '1';
		elsif(Vcount = v2) then
			Vactive <= '1';
		elsif(Vcount = v3) then
			Vactive <= '0';
		elsif(Vcount = v4) then
			Vsync <= '0';
			Vcount <= 1;
		end if;
	end if;
end process;

Hactiveout <= Hactive;
Vactiveout <= Vactive;
Hcountout <= Hcount;
Vcountout <= Vcount;

end architecture behavioural;
