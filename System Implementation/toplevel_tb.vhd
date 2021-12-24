library ieee;
use ieee.std_logic_1164.all;

entity toplevel_tb is
end toplevel_tb;

architecture behaviour of toplevel_tb is
   component chip is 
	port(
	clk			: 	in std_logic;
	reset			:	in std_logic;
	input1, input2, input3, input4, input5, input6, input7, input8	:	in std_logic; 
	input_arduino		: 	in std_logic_vector (4 downto 0);
	input_confirm		:	in std_logic;
	output_buzzer		:	out std_logic;
	output_song_select	:	out std_logic_vector (2 downto 0);
	output_handshake	:	out std_logic;
	r, g, b			:	out std_logic_vector (1 downto 0);  --output gpu
	Hsync, Vsync		:	out std_logic                       --output gpu
	);
   end component chip;

   	signal clk, reset							: std_logic;
	signal input1, input2, input3, input4, input5, input6, input7, input8	:	std_logic; 
	signal input_arduino							: 	std_logic_vector (4 downto 0);
	signal input_confirm							:	std_logic;
	signal output_buzzer							:	std_logic;
	signal output_song_select						:	std_logic_vector (2 downto 0);
	signal output_handshake							:	std_logic;
	signal r, g, b								:	std_logic_vector (1 downto 0);  --output gpu
	signal Hsync, Vsync							:	std_logic;                       --output gpu
begin
   test: chip port map (clk, reset, input1, input2, input3, input4, input5, input6, input7, input8, input_arduino, input_confirm, output_buzzer, output_song_select, output_handshake, r,g,b, Hsync, Vsync);
   	clk <= '0' after 0 ns,
          '1' after 5 ns when clk /= '1' else '0' after 5 ns;   --10 ns per clk period

	reset <= '1' after 0 ns, '0' after 60 ns;            


	input_arduino <= "00000" after 0 ns,
			 "00001" after 253 ns,
			 "00010" after 656 ns,
			 "00011" after 1054 ns,
			 "00101" after 1453 ns,
			 "00110" after 1858 ns,
			 "00111" after 2254 ns,
			 "01001" after 2656 ns,
			 "00000" after 3054 ns;
			

	input_confirm <= '0' after 0 ns,    --new data
			 '1' after 253 ns,
			 '0' after 656 ns,
			 '1' after 1054 ns,
			 '0' after 1453 ns,
		 	 '1' after 1858 ns,
			 '0' after 2254 ns,
			 '1' after 2656 ns,
		 	 '0' after 3054 ns,
			 '1' after 3589 ns;
		
	input1 <= 	 '0' after 0 ns,    
		   	 '1' after 4 ms,  --C1 short   --125 us  --arduino klaar
			 '0' after 124 ms, 
			 '1' after 150 ms, --C1 mid     --250 us
			 '0' after 388 ms, 
			 '1' after 400 ms, --C1 long    --500 us
			 '0' after 888 ms; 
        
		
	input2 <= 	 '0' after 0 ns,    
		   	 '1' after 900 ms,  --D short   --125 us  --arduino klaar
			 '0' after 1020 ms, 
			 '1' after 1050 ms, --D mid     --250 us
			 '0' after 1288 ms, 
			 '1' after 1300 ms, --D long    --500 us
			 '0' after 1788 ms; 

--			"00000" after 0 ns,  --stop
--			 "00001" after 253 ns,  --C1 short
--			 "00010" after 656 ns,  --C1 mid
--			 "00011" after 1054 ns, --C1 long

--			 "00100" after 1453 ns, --D short
--			 "00101" after 1858 ns, -- D mid
--			 "00110" after 2254 ns, -- D long

--			 "00111" after 2656 ns,  --E short

		           
		
	input3 <= 	 '0' after 0 ns, 
			 '1' after 50 ns,
			 '0' after 80 ns,   
		   	 '1' after 1800 ms,  --E short   --125 us  --arduino klaar
			 '0' after 1920 ms; 

--		
	input4 <= 	 '0' after 0 ns;
--		   	 '1' after 4 us,  --C1 short   --125 us  --arduino klaar
--			 '0' after 124 us, 
--			 '1' after 150 us, --C1 mid     --250 us
--			 '0' after 388 us, 
--			 '1' after 400 us, --C1 long    --500 us
--			 '0' after 888 us;
--		
	input5 <= 	 '0' after 0 ns;    
--		   	 '1' after 4 us,  --C1 short   --125 us  --arduino klaar
--			 '0' after 124 us, 
--			 '1' after 150 us, --C1 mid     --250 us
--			 '0' after 388 us, 
--			 '1' after 400 us, --C1 long    --500 us
--			 '0' after 888 us;  
--
--		
	input6 <= 	 '0' after 0 ns;   
--		   	 '1' after 4 us,  --C1 short   --125 us  --arduino klaar
--			 '0' after 124 us, 
--			 '1' after 150 us, --C1 mid     --250 us
--			 '0' after 388 us, 
--			 '1' after 400 us, --C1 long    --500 us
--			 '0' after 888 us;
--
--		
	input7 <= 	 '0' after 0 ns;    
--		   	 '1' after 4 us,  --C1 short   --125 us  --arduino klaar
--			 '0' after 124 us, 
--			 '1' after 150 us, --C1 mid     --250 us
--			 '0' after 388 us, 
--			 '1' after 400 us, --C1 long    --500 us
--			 '0' after 888 us;  
--
--		
	input8 <= 	 '0' after 0 ns;    
--		   	 '1' after 4 us,  --C1 short   --125 us  --arduino klaar
--			 '0' after 124 us, 
--			 '1' after 150 us, --C1 mid     --250 us
--			 '0' after 388 us, 
--			 '1' after 400 us, --C1 long    --500 us
--			 '0' after 888 us; 
		
end behaviour;

