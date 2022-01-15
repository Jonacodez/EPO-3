library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;

entity ram is
      port(address : in std_logic_vector(3 downto 0);
           data_in : in std_logic_vector(7 downto 0);
           data_out : out std_logic_vector(7 downto 0);
           write : in std_logic);
end ram;

architecture behaviour of ram is
	type ram_type is array (0 to (2**address'length)-1) of std_logic_vector(data_in'range);
	signal ram : ram_type;
begin
	ramlat: process(address,write) is
	begin
		if write = ('1') then
			ram(to_integer(unsigned(address))) <= data_in;
      		end if;
  	end process;
data_out <= ram(to_integer(unsigned(address)));
end behaviour;
