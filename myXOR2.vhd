library ieee;
use ieee.std_logic_1164.all;

entity myXOR2 is
port (in1, in2: in std_logic;
		out1: out std_logic);
end myXOR2;

architecture logicFunc of myXOR2 is 
begin
	out1 <= in1 XOR in2;
end logicFunc;

