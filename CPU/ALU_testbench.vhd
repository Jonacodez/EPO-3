LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY tb IS
END tb;

ARCHITECTURE behavior OF tb IS

   signal Clk : std_logic := '0';
   signal A,B,R : signed(7 downto 0) := (others => '0');
   signal Op : unsigned(2 downto 0) := (others => '0');
   constant Clk_period : time := 10 ns;

BEGIN

    -- Instantiate the Unit Under Test (UUT)
   uut: entity work.simple_alu PORT MAP (
          Clk => Clk,
          A => A,
          B => B,
          Op => Op,
          R => R
        );

   -- Clock process definitions
   Clk_process :process
   begin
        Clk <= '0';
        wait for Clk_period/2;
        Clk <= '1';
        wait for Clk_period/2;
   end process;
   
   -- Stimulus process
   stim_proc: process
   begin       
      wait for Clk_period*1;
        A <= "00010010"; --18 in decimal
        B <= "00001010"; --10 in decimal
        Op <= "000";  wait for Clk_period; --add A and B
        Op <= "001";  wait for Clk_period; --subtract B from A.
        Op <= "010";  wait for Clk_period; --Bitwise NOT of A
        Op <= "011";  wait for Clk_period; --Bitwise NAND of A and B
        Op <= "100";  wait for Clk_period; --Bitwise NOR of A and B
        Op <= "101";  wait for Clk_period; --Bitwise AND of A and B
        Op <= "110";  wait for Clk_period; --Bitwise OR of A and B
        Op <= "111";  wait for Clk_period; --Bitwise XOR of A and B
      wait;
   end process;

END;
