library ieee;
use ieee.std_logic_1164.all;

entity FullAdder is 
	port(input1, input2, cin: in std_logic;
		  sum, cout: out std_logic); --to sum gia klisi apo add kai sub logw portmap ths fulladder
end FullAdder;

architecture structural of FullAdder is

component myAND2
port(in1, in2: in std_logic;
	  out1: out std_logic);
end component;

component myOR3
port(in1, in2, in3: in std_logic;
	  out1: out std_logic);
end component;

signal s1, s2,  s3: std_logic;

begin
	v1: myAND2 port map (input1, input2, s1);
	v2: myAND2 port map (input1, cin, s2);
	v3: myAND2 port map (input2, cin, s3);
	v4: myOR3 port map (s1, s2, s3, cout);
end structural;
 
