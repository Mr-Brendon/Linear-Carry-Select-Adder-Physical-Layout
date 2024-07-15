----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- Module Name:
-- Project Name: 
-- Additional Comments:
--To work properly this adder has to be made by Carry-lookahead adder,
--so for first we need to implement this strcture block
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
--use IEEE.NUMERIC_STD.ALL;
--use UNISIM.VComponents.all;
 
 entity core is
    port(A, B: in std_logic_vector(31 downto 0);
         Cin: in std_logic;
         Sum: out std_logic_vector(31 downto 0);
         Cout: out std_logic_vector;
         );
 end core;
 
 
 architecture core_bh of core is
 
 
begin


end core_bh;
 
