library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;

 

entity counter is
    port (      clk          : in std_logic;
        	reset         : in std_logic;
                count_out     : out std_logic_vector (1 downto 0) 
);

 
end entity counter;
architecture behavioural of counter is

 

             signal count, new_count : unsigned (1 downto 0);

 

begin -- register process

 
    process (clk)
    begin 
             if (rising_edge (clk)) then
                         if (reset = '1') then 
                                count <= (others => '0');   --set 0 to reset
             else 
                         count <= new_count;
             end if;
          end if;
    end process;
          -- give the new value of count(new_count is here defined)

 

   process (count) 
   begin 
          new_count <= count + 1;
   end process;

 

count_out <= std_logic_vector (count);

 

end architecture behavioural ;
