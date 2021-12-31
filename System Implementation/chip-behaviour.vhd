library IEEE;
use IEEE.std_logic_1164.ALL;
use ieee.numeric_std.all;

architecture behaviour of chip is

	component pwm_gen is
		 port	(clk       : in  std_logic;
        		reset      : in  std_logic;
        		succes_bit : in  std_logic;
       			notes_OUT  : in  std_logic_vector(4 downto 0); 
			 input_s : in std_logic;
        		pwm_out  : out std_logic);
	end component pwm_gen;
	
	component processor is
		port( 
			clk			: in std_logic;
			res			: in std_logic;
			notes_OUT		: in std_logic_vector(4 downto 0);	--ehhh 4 downto 0???
			notesA_OUT		: in std_logic_vector(4 downto 0);
			succesbit_pwm		: out std_logic;
			succesbit_gpu		: out std_logic;
			succesbit_bit: out std_logic
		);
	end component processor;

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

	component toplevel_GPU is 
		port(	clk, reset		:	in std_logic;
			output0, output1, output2, output3, output4, output5, output6, output7	:	in std_logic_vector (4 downto 0);
			r, g, b			:	out std_logic_vector (1 downto 0);
			Hsync, Vsync		:	out std_logic
		);
	end component toplevel_GPU;
	
	component toplevel_INPUT is
	port(
		clk   : in  std_logic;
		reset : in  std_logic;
		KEY0 : in std_logic;
		KEY1 : in std_logic;
		KEY2 : in std_logic;
		KEY3 : in std_logic;
		SW0  : in std_logic;
		SW1  : in std_logic;
		input_s	: out std_logic;
		notes_OUT : out std_logic_vector(4 downto 0)
	);
	end component toplevel_INPUT;
	
	
	signal succesbit_pwm								: std_logic;
	signal succesbit_gpu								: std_logic;
	signal succesbit_bit								: std_logic;
	signal input_mat  								: std_logic_vector(2 downto 0);
	signal output0, output1, output2, output3, output4, output5, output6, output7	: std_logic_vector (4 downto 0);
	signal notes_OUT								: std_logic_vector (4 downto 0);
	signal input									: std_logic_vector(7 downto 0);
	signal pulse_len								: std_logic_vector (2 downto 0);
	signal input_s								: std_logic;

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
			when "00001111" => 
				input_mat <= "000";
			when "00001110" => 
				input_mat <= "001";
			when "00001101" => 
				input_mat <= "010";
			when "00001011" => 
				input_mat <= "011";
			when "00000111" => 
				input_mat <= "100";
			when "00011111" => 
				input_mat <= "101";
			when "00101011" => 
				input_mat <= "110";
			when "01001111" => 
				input_mat <= "111";
			when  others   => 
				input_mat <= "000";
		end case;
	end process;
	

toplevel_BUZZER1: pwm_gen port map(clk, reset, succesbit_pwm, output0, input_s,output_buzzer);
			  
cpu_controller1: processor port map(clk, reset, notes_OUT, output0, succesbit_pwm, succesbit_gpu, succesbit_bit); 

toplevel_RAM1: toplevel_RAM port map(input_arduino, input_confirm, input_mat, succesbit_bit, clk, reset, output_song_select, output_handshake, output0, output1, output2, output3, output4, output5, output6, output7);

gpu1: toplevel_GPU port map(clk, reset, output0, output1, output2, output3, output4, output5, output6, output7, r, g, b, Hsync, Vsync);

toplevel_INPUT1: toplevel_INPUT port map (clk, reset, input1, input2, input3, input4, input5, input6,input_s,notes_OUT);

end behaviour;

