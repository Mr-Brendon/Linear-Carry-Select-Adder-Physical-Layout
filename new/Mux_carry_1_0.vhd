----------------------------------------------------------------------------------
-- Mux 1 bit
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Mux_carry_1_0 is
    port(In1, In2, Control: in std_logic;
         Y: out std_logic);
end Mux_carry_1_0;

architecture bh of Mux_carry_1_0 is

signal temp1, temp2: std_logic;

begin

temp1 <= In1 and (not Control);
temp2 <= In2 and Control;
Y <= temp1 or temp2;

end bh;
