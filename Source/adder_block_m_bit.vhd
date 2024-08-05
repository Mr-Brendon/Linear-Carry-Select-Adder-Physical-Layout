----------------------------------------------------------------------------------
--8 bits lookahead_adder blok, with double sum with no carry or with carry '1'
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity adder_block_m_bit is
    generic(M: integer := 8);
    port(In1, In2: in std_logic_vector(M-1 downto 0);
         Cin_block: in std_logic;
         Sum_block: out std_logic_vector(M-1 downto 0);
         Cout_block: out std_logic);
end adder_block_m_bit;

architecture Behavioral of adder_block_m_bit is



component Carry_lookahead_adder is
    port(A, B, Cin: in std_logic;
         Cout, Sum: out std_logic);
 
end component;        
         
component Mux_carry_1_0 is
    port(In1, In2, Control: in std_logic;
         Y: out std_logic);
end component;



signal Sum_mux1, Sum_mux2: std_logic_vector(M-1 downto 0);
signal temp1: std_logic_vector(M downto 0); --one more due to first Cin and last Cout
signal temp2: std_logic_vector(M downto 0); --one more due to first Cin and last Cout

begin

--section one: sum with carry = '0'
----------------------------------------------------------------------------------

tpp1: for i in 0 to M-1 generate
    look_ahead: Carry_lookahead_adder port map(A => In1(i), B => In2(i), Cin => temp1(i) , Cout => temp1(i+1), Sum => Sum_mux1(i));
end generate;

temp1(0) <= '0'; --set up with carry to zero
----------------------------------------------------------------------------------



--section two: sum with carry = '1'
----------------------------------------------------------------------------------

tpp2: for i in 0 to M-1 generate
    look_ahead: Carry_lookahead_adder port map(A => In1(i), B => In2(i), Cin => temp2(i) , Cout => temp2(i+1), Sum => Sum_mux2(i));
end generate;

temp2(0) <= '1'; --set up with carry to one
----------------------------------------------------------------------------------


--section sum mux
----------------------------------------------------------------------------------

tpp3: for i in 0 to M-1 generate
    mux_sum: Mux_carry_1_0 port map(In1 => Sum_mux1(i), In2 => Sum_mux2(i), Y => Sum_block(i), Control => Cin_block);    --all the mux are linked with Cin_block
end generate;
----------------------------------------------------------------------------------



--section carry mux
----------------------------------------------------------------------------------

mux_carry: Mux_carry_1_0 port map(In1 => temp1(M), In2 => temp2(M), Y => Cout_block, Control => Cin_block);
----------------------------------------------------------------------------------



end Behavioral;
