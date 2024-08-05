----------------------------------------------------------------------------------
-- Module Name: core
-- Project Name: LinearCarrySelectAdder32Bit
--
--This 32 bit adder is a linear Carry Adder made with lookahead_adder:
--4 adder_bloks with 8 bit each one.
--total: 32 bits.
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
--use IEEE.NUMERIC_STD.ALL;
--use UNISIM.VComponents.all;
 
entity core is
    generic(M: integer := 8;   --bits per block
            N: integer := 4;   --numbers of blocks
            Num: integer := 32);
    port(A, B: in std_logic_vector(Num-1 downto 0);
         Cin: in std_logic;
         Sum: out std_logic_vector(Num-1 downto 0);
         Cout: out std_logic);
end core;


architecture core_bh of core is

component adder_block_m_bit is
    port(In1, In2: in std_logic_vector(M-1 downto 0);
         Cin_block: in std_logic;
         Sum_block: out std_logic_vector(M-1 downto 0);
         Cout_block: out std_logic);
end component;

signal temp: std_logic_vector(N downto 0);

begin

--blocks
---------------------------------------------------------------------------------------

blocks: for i in 0 to N-1 generate

    linear_adder: adder_block_m_bit port map(In1 => A((((i+1)*M)-1) downto (i*M)), In2 => B((((i+1)*M)-1) downto (i*M)), Sum_block => Sum((((i+1)*M)-1) downto (i*M)), Cin_block => temp(i), Cout_block => temp(i+1));

end generate;

temp(0) <= Cin;
Cout <= temp(N);

---------------------------------------------------------------------------------------


end core_bh;
 

