library IEEE;
use IEEE.std_logic_1164.ALL;

entity com_com is
		port (
		ard_in    : in  std_logic_vector(4 downto 0);
        confirm   : in  std_logic;
        mat_in    : in  std_logic_vector(2 downto 0);
        succes    : in  std_logic;
        clk       : in  std_logic;
        reset     : in  std_logic;
        end_bit   : in  std_logic;
        arr_out   : out std_logic_vector(4 downto 0);
        song_sel  : out std_logic_vector(2 downto 0);
        handshake : out std_logic;
        shift     : out std_logic;
		shift2		  : out	std_logic);
end com_com;

