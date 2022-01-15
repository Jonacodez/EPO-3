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

	component detect_input port(   
		KEY0 : in std_logic;
		KEY1 : in std_logic;
		KEY2 : in std_logic;
		KEY3 : in std_logic;
		input_d : out std_logic
     );
	end component detect_input;

	component pulse_length port(
		clk         	: in  std_logic;
		reset        	: in  std_logic;
		input_p				: in std_logic;
		pulse_len	: out std_logic_vector(2 downto 0));
	end component pulse_length;

	component button port(
		clk  : in std_logic;
		reset : in std_logic;
		pulse_len	: in std_logic_vector(2 downto 0);
		KEY0 : in std_logic;
		KEY1 : in std_logic;
		KEY2 : in std_logic;
		KEY3 : in std_logic;
		SW0  : in std_logic;
		song_select : out std_logic_vector(2 downto 0);
		notes_OUT : out std_logic_vector(4 downto 0));
	end component button;


	component processor is
		port( 
			clk			: in std_logic;
			res			: in std_logic;
			mode			: in std_logic;
			input_d			: in std_logic;
			notes_OUT		: in std_logic_vector(4 downto 0);	--ehhh 4 downto 0???
			notesA_OUT		: in std_logic_vector(4 downto 0);
			regA_OUT			: in std_logic_vector(4 downto 0);
			succesbit_pwm		: out std_logic;
			succesbit_bit: out std_logic;
			score				: out std_logic_vector(5 downto 0)
		);
	end component processor;

	component toplevel_RAM is
	port(ard_in	: in std_logic_vector(4 downto 0);
		confirm : in std_logic;
		mat_in  : in std_logic_vector(2 downto 0);
		succes	: in std_logic;
		reg_2_succes : in std_logic;
		clk	: in std_logic;
		reset	: in std_logic;
		shift	: out std_logic;
		song_sel : out std_logic_vector(2 downto 0);
		handshake : out std_logic;
		output0, output1, output2, output3, output4, output5, output6, output7: out std_logic_vector(4 downto 0);
		reg_2_out : out std_logic_vector(4 downto 0));
	end component;
	component toplevel_GPU is 
		port(	clk, reset		:	in std_logic;
			note_confirm 	: in std_logic;
			mode_sel : in std_logic;
			output0, output1, output2, output3, output4, output5, output6, output7	:	in std_logic_vector (4 downto 0);
			rout, gout, bout			:	out std_logic_vector (1 downto 0);
			Hsync, Vsync		:	out std_logic
		);
	end component toplevel_GPU;
	
	component mode_accuracy is
		port(clk          : in  std_logic;
         res          : in  std_logic;
			notesA_OUT			: in	 std_logic_vector(4 downto 0);
         succes					 : out std_logic);
	end component;

	signal succesbit_pwm								: std_logic;
	signal succesbit_bit								: std_logic;
	signal song_select  								: std_logic_vector(2 downto 0);
	signal output0, output1, output2, output3, output4, output5, output6, output7	: std_logic_vector (4 downto 0);
	signal notes_OUT								: std_logic_vector (4 downto 0);
	signal input									: std_logic_vector(7 downto 0);
	signal pulse_len								: std_logic_vector (2 downto 0);
	signal input_d								: std_logic;
	signal shift								: std_logic;
	signal reg2_signal								: std_logic_vector(4 downto 0);
	signal succes									: std_logic;
	
begin

	
toplevel_BUZZER1: pwm_gen port map(clk, reset, succesbit_pwm, output0, input_d,output_buzzer);

dec:detect_input port map(KEY0,KEY1,KEY2,KEY3,input_d);

pulse:pulse_length port map (clk,reset,input_d,pulse_len);

but:button port map(clk, reset, pulse_len,KEY0,KEY1,KEY2,KEY3,SW0,song_select,notes_OUT);
			  
cpu_controller1: processor port map(clk, reset, mode,input_d,notes_OUT,output0,reg2_signal,succesbit_pwm, succesbit_bit,score); 

toplevel_RAM1: toplevel_RAM port map(input_arduino, input_confirm, song_select, succesbit_bit, succes, clk, reset, shift,output_song_select, output_handshake, output0, output1, output2, output3, output4, output5, output6, output7, reg2_signal);

gpu1: toplevel_GPU port map(clk, reset, shift, mode, output0, output1, output2, output3, output4, output5, output6, output7, rout, gout, bout, Hsync, Vsync);

mode2 : mode_accuracy port map (clk,reset,output0,succes);

end behaviour;
