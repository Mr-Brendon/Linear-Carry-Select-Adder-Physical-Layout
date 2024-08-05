----------------------------------------------------------------------------------
--An easy testbench to verify the correctness of the adder, which will be updated to show the speed of this architecture using an FPGAfpga
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity testbench is
    generic(Num: integer := 32);  --numbers of blocks
end testbench;

architecture Behavioral of testbench is

component core is
    port(A, B: in std_logic_vector(Num-1 downto 0);
         Cin: in std_logic;
         Sum: out std_logic_vector(Num-1 downto 0);
         Cout: out std_logic);
end component;

signal A, B, Sum: std_logic_vector(Num-1 downto 0);
signal Cin, Cout: std_logic;
signal count: std_logic:= '0';
signal SumC: std_logic_vector(Num downto 0);
begin
SumC <= Cout & Sum;
linear_carry_adder_32_bit: core port map (A => A, B=> B, Sum => Sum, Cin => Cin, Cout => Cout);

-----------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------

process
begin

Cin <= '0';


A <= "00000000000000000000000000101010";
B <= "00000000000000000000000000010101";
wait for 1 ms;

A <= "00000000000000000000000000001010";
B <= "00000000000000000000000001101100";
wait for 1 ms;


A <= (others => '0');
B <= "00000000100001000000000010001000";
wait for 1 ms;

A <= "00000000000000000000000000000010";
B <= "00000000000000000000000000000100";
wait for 1 ms;

A <= "00000000000000000000000001101100";
B <= "00000000000000000000000001100100";
wait for 1 ms;


A <= (others => '0');
B <= "00000000000000000000000010001000";
wait for 1 ms;

A <= "00000000000000000000000000110010";
B <= "00000000000000000000000000000100";
wait for 1 ms;

A <= "00000000000000000000000001111100";
B <= "00000000000000000000000001101100";
wait for 1 ms;

A <= "00000000000000000000000000010010";
B <= "00000000000000000000000001100100";
wait for 1 ms;

A <= "00000000000000000000000001111100";
B <= "00000000000000000000000001111101";
wait for 1 ms;



A <= "00000001100000000100000000110010";
B <= "00000000110010000000000000000100";
wait for 1 ms;

A <= "00000000000011010100000001111100";
B <= "00000000010011101000000001101100";
wait for 1 ms;

A <= "11000000000000000000000000010010";
B <= "01000000000000000000000001100100";
wait for 1 ms;

A <= "01000011100010000000000001111100";
B <= "00001001000011000000000001111101";
wait for 1 ms;



A <= "10000000011000000000001111000000";
B <= "10000010010000000000001111000000";
wait;
std.env.stop;

end process;


end Behavioral;
