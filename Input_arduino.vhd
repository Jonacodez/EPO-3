library IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

entity InputA is
    port(   	clk	    	: in std_logic;
		reset     	: in std_logic;
        	notesA_IN 	: in std_logic_vector (4 downto 0); --notes from arduino
       		notesA_OUT  	: out std.standard.character
        );
end InputA;


architecture behavioral of InputA is
signal threebits : std_logic_vector(2 downto 0); 
begin
threebits <= notesA_IN (4 downto 2); --remove last 2 bits from arduino
	process(notesA_IN)
	begin
		if(threebits = "000") then
			notesA_OUT <= 's';
		elsif(threebits = "001") then
			notesA_OUT <= 'c';
		elsif(threebits = "010") then
			notesA_OUT <= 'j';
		elsif(threebits = "100") then
			notesA_OUT <= 'd';
		elsif(threebits = "01100") then
			notesA_OUT <= 'k';
		elsif(threebits = "101") then
			notesA_OUT <= 'e';
		elsif(threebits = "110") then
			notesA_OUT <= 'f';
		elsif(threebits = "111") then
			notesA_OUT <= 'g';
		end if;
	end process;  
end architecture;
