library IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

entity Input is
    port(   	clk	    	: in std_logic;
		reset     	: in std_logic;
        	notes_IN 	: in std_logic_vector (2 downto 0);
       		notes_OUT  	: out std.standard.character
        );
end Input;


architecture behavioral of Input is
 
begin
	process(notes_IN)
	begin
		if(notes_IN = "000") then
			notes_OUT <= 's';
		elsif(notes_IN = "001") then
			notes_OUT <= 'c';
		elsif(notes_IN = "010") then
			notes_OUT <= 'j';
		elsif(notes_IN = "100") then
			notes_OUT <= 'd';
		elsif(notes_IN = "011") then
			notes_OUT <= 'k';
		elsif(notes_IN = "101") then
			notes_OUT <= 'e';
		elsif(notes_IN = "110") then
			notes_OUT <= 'f';
		elsif(notes_IN = "111") then
			notes_OUT <= 'g';
		end if;
	end process;  
end architecture;
