library ieee;
use ieee.std_logic_1164.all;

entity ADD1b is
port (input1, input2: in std_logic;
	   cin: in std_logic;
		sum: out std_logic;
		cout: out std_logic);
end ADD1b;

architecture structural of ADD1b is

component FullAdder
port(input1, input2, cin: in std_logic;
	  sum, cout: out std_logic);
end component;

signal c: std_logic;

begin

	FA: FullAdder port map (input1, input2, cin, sum, c);
	cout <= c;
	
end structural;

