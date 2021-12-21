library ieee;
use ieee.std_logic_1164.all;

entity chip is 
	port(
	input1, input2, input3, input4, input5, input6, input7, input8	:	in std_logic; 
	input_arduino		: 	in std_logic_vector (4 downto 0);
	input_confirm		:	in std_logic;
	output_buzzer		:	out std_logic;
	output_song_select	:	out std_logic_vector (2 downto 0);
	output_handshake	:	out std_logic;
	r, g, b			:	out std_logic_vector (1 downto 0);  --output gpu
	Hsync, Vsync		:	out std_logic                       --output gpu
	);
end chip;


architecture behavioural of chip is

	component pwm_gen is
		 port	(clk       : in  std_logic;
        		reset      : in  std_logic;
        		succes_bit : in  std_logic;
       			notes_OUT  : in  std_logic_vector(2 downto 0);                 --ehhh 4 downto 0???
        		count_out  : out std_logic);
	end component pwm_gen;
	
	component cpu_controller is
		port( 
			clk			: in std_logic;
			res			: in std_logic;
			notes_OUT		: in std_logic_vector(2 downto 0);	--ehhh 4 downto 0???
			notesA_OUT		: in std_logic_vector(4 downto 0);
			succesbit_pwm		: out std_logic;
			succesbit_gpu		: out std_logic;
			succesbit_bitshifter	: out std_logic
		);
	end component cpu_controller;

	component toplevel_RAM is
		port(ard_in	: in std_logic_vector(4 downto 0);
			confirm : in std_logic;
			mat_in  : in std_logic_vector(2 downto 0);
			succes	: in std_logic;
			clk	: in std_logic;
			reset	: in std_logic;
			song_sel : out std_logic_vector(2 downto 0);
			handshake : out std_logic;
			output0, output1, output2, output3, output4, output5, output6, output7: out std_logic_vector(4 downto 0));
	end component toplevel_RAM;

	component gpu is 
		port(	clk, reset		:	in std_logic;
			output0, output1, output2, output3, output4, output5, output6, output7	:	in std_logic_vector (4 downto 0);
			r, g, b			:	out std_logic_vector (1 downto 0);
			Hsync, Vsync		:	out std_logic
		);
	end component gpu;
	
	signal clk, reset								: std_logic;
	signal succesbit_pwm								: std_logic;
	signal succesbit_gpu								: std_logic;
	signal succesbit_bitshifter							: std_logic;
	signal input_mat  								: std_logic_vector(2 downto 0);
	signal output0, output1, output2, output3, output4, output5, output6, output7	: std_logic_vector (4 downto 0);
	signal input									: std_logic_vector(7 downto 0);

begin

input(0) <= input1;
input(1) <= input2;
input(2) <= input3;
input(3) <= input4;
input(4) <= input5;
input(5) <= input6;
input(6) <= input7;
input(7) <= input8;

	process (input)
	
	begin
		case input is
			when "00000000" => 
				input_mat <= "000";
			when "00000001" => 
				input_mat <= "001";
			when "00000010" => 
				input_mat <= "010";
			when "00000100" => 
				input_mat <= "011";
			when "00001000" => 
				input_mat <= "100";
			when "00010000" => 
				input_mat <= "101";
			when "00100100" => 
				input_mat <= "110";
			when "01000000" => 
				input_mat <= "111";
			when  others   => 
				input_mat <= "000";
		end case;
	end process;
	

pwm_gen1: pwm_gen port map(clk, reset, succesbit_pwm, input_mat, output_buzzer);
			  

cpu_controller1: cpu_controller port map(clk, reset, input_mat, output0, succesbit_pwm, succesbit_gpu, succesbit_bitshifter); 

toplevel_RAM1: toplevel_RAM port map(input_arduino, input_confirm, input_mat, succesbit_bitshifter, clk, reset, output_song_select, output_handshake, output0, output1, output2, output3, output4, output5, output6, output7);

gpu1: gpu port map(clk, reset, output0, output1, output2, output3, output4, output5, output6, output7, r, g, b, Hsync, Vsync);


end behavioural;

	



	
	
	



