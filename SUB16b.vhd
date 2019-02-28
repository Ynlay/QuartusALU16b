library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;

entity SUB16b is
port(input1, input2: in std_logic_vector(15 downto 0);
	  cin: in std_logic;
	  sum: out std_logic_vector(15 downto 0);
	  cout, v: out std_logic);
end SUB16b;

architecture structural of SUB16b is

component FullAdder 
port (input1, input2, cin: in std_logic;
		sum, cout: out std_logic);
end component;

signal c: std_logic_vector(16 downto 1);
signal invertInput2: std_logic_vector(0 to 15);
signal cin_1: std_logic  := '1';

begin

	inv_Subtraction: for i in 0 to 15 generate
		invertInput2(i) <= input2(i) XOR cin_1;
	end generate inv_Subtraction;
	
	FA0: FullAdder port map (input1(0), invertInput2(0), cin_1, sum(0), c(1));
	FA1: FullAdder port map (input1(1), invertInput2(1), c(1), sum(1), c(2));
	FA2: FullAdder port map (input1(2), invertInput2(2), c(2), sum(2), c(3));
	FA3: FullAdder port map (input1(3), invertInput2(3), c(3), sum(3), c(4));
	FA4: FullAdder port map (input1(4), invertInput2(4), c(4), sum(4), c(5));
	FA5: FullAdder port map (input1(5), invertInput2(5), c(5), sum(5), c(6));
	FA6: FullAdder port map (input1(6), invertInput2(6), c(6), sum(6), c(7));
	FA7: FullAdder port map (input1(7), invertInput2(7), c(7), sum(7), c(8));
	FA8: FullAdder port map (input1(8), invertInput2(8), c(8), sum(8), c(9));
	FA9: FullAdder port map (input1(9), invertInput2(9), c(9), sum(9), c(10));
	FA10: FullAdder port map (input1(10), invertInput2(10), c(10), sum(10), c(11));
	FA11: FullAdder port map (input1(11), invertInput2(11), c(11), sum(11), c(12));
	FA12: FullAdder port map (input1(12), invertInput2(12), c(12), sum(12), c(13));
	FA13: FullAdder port map (input1(13), invertInput2(13), c(13), sum(13), c(14));
	FA14: FullAdder port map (input1(14), invertInput2(14), c(14), sum(14), c(15));
	FA15: FullAdder port map (input1(15), invertInput2(15), c(15), sum(15), c(16));
	
	v <= c(15) XOR c(16);
	cout <= c(16);
end structural;