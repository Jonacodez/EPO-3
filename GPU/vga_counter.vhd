library ieee;
use ieee.std_logic_1164.all;

entity vga_counter is
	port(	clk, reset		:	in std_logic;
		Hsync, Vsync		:	buffer std_logic;
		r, g, b			:	out std_logic;
		nblanck, nsync		:	out std_logic;
		--testing
		pixel_clk_out		:	out std_logic;
		Vcounto, Hcounto	:	out integer;
		Vactiveo, Hactiveo	:	out std_logic;
		denao			:	out std_logic
		);
end vga_counter;

architecture control of vga_counter is

	constant h1: integer:= 96; --hpulse
	constant h2: integer:= 144; --hpulse + hbackport
	constant h3: integer:= 784; --hpulse + hbackport + hactive
	constant h4: integer:= 800; --hpulse + hbackport + hactive + hfrontport
	constant v1: integer:= 2;
	constant v2: integer:= 35;
	constant v3: integer:= 515;
	constant v4: integer:= 525;

	signal Hactive, Vactive, dena	:	std_logic;
	signal pixel_clk		:	std_logic;
	signal Vcount			:	positive range 1 to v4 + 1;
	signal Hcount			:	positive range 1 to h4 + 1;

begin

--set the right starting values
nblanck <= '1';
nsync <= '0';
pixel_clk <= clk;
--Hsync signal generation
p1: process(pixel_clk)
begin
	if(pixel_clk'event and pixel_clk = '1') then
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
p2: process(Hsync)
begin
	if(Hsync'event and Hsync = '1') then
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

--testing
pixel_clk_out <= pixel_clk;
Vcounto <= Vcount;
Hcounto <= Hcount;
Hactiveo <= Hactive;
Vactiveo <= Vactive;
denao <= dena;
end architecture control;

