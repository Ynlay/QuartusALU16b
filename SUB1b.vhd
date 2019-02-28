library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;

entity SUB1b is
port(input1, input2: in std_logic;
	  cin: in std_logic;
	  sum: out std_logic;
	  cout: out std_logic);
end SUB1b;

architecture structural of SUB1b is

component FullAdder 
port (input1, input2, cin: in std_logic;
		sum, cout: out std_logic);
end component;

signal c: std_logic;
signal invertInput2: std_logic;
signal cin_1: std_logic  := '1';

begin

	
	invertInput2 <= input2 XOR cin_1;
	
	
	FA: FullAdder port map (input1, invertInput2, cin_1, sum, c);
	cout <= c;
end structural;