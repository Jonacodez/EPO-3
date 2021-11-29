
library IEEE;
-- Please add necessary libraries:
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;


entity com_timebase is
    port (clk    : in std_logic;
         reset   : in std_logic;
         clk2    : out std_logic
    );
end entity com_timebase;

architecture behavioural of com_timebase is
        
signal cnt, new_cnt            :    unsigned (4 downto 0);
signal clki, clki2             :    std_logic;

begin

process(clk, reset) --clock count
begin
    if (rising_edge(clk)) then
        if cnt = "00101" or reset = '1' then
            new_cnt <= "00000";
        else
            new_cnt <= cnt + 1;
        end if;
    end if;
end process;

process(clk, reset, cnt) --newish clock
begin
    if (rising_edge(clk)) then
        if reset = '1' then
            clki <= '0';
        else
            if cnt = "00101" then
            clki <= not clki2;
            end if;
        end if;
    end if;
end process;

clki2 <= clki;
clk2 <= clki;
cnt <= new_cnt;

end behavioural;