----------------------------------------------------------------------------------
--lookahead_adder
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
--use IEEE.NUMERIC_STD.ALL;
--use UNISIM.VComponents.all;


entity Carry_lookahead_adder is
    port(A, B, Cin: in std_logic;
         Cout, Sum: out std_logic);
end Carry_lookahead_adder;


architecture bh of Carry_lookahead_adder is

signal G, P: std_logic;

begin

--setup Propagate and Generate
P <= A xor B;
G <= A and B;

--output with Propagate and Generate
Cout <= G or (P and Cin);
Sum <= P xor Cin;

end bh;
