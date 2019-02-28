library ieee;
use ieee.std_logic_1164.all;

entity ADD16b is
port (input1, input2: in std_logic_vector(15 downto 0);
	   cin: in std_logic;
		sum: out std_logic_vector(15 downto 0);
		cout, v: out std_logic);
end ADD16b;

architecture structural of ADD16b is

component FullAdder
port(input1, input2, cin: in std_logic;
	  sum, cout: out std_logic);
end component;

signal c: std_logic_vector(16 downto 1);

begin

	FA0: FullAdder port map (input1(0), input2(0), cin, sum(0), c(1));
	FA1: FullAdder port map (input1(1), input2(1), c(1), sum(1), c(2));
	FA2: FullAdder port map (input1(2), input2(2), c(2), sum(2), c(3));
	FA3: FullAdder port map (input1(3), input2(3), c(3), sum(3), c(4));
	FA4: FullAdder port map (input1(4), input2(4), c(4), sum(4), c(5));
	FA5: FullAdder port map (input1(5), input2(5), c(5), sum(5), c(6));
	FA6: FullAdder port map (input1(6), input2(6), c(6), sum(6), c(7));
	FA7: FullAdder port map (input1(7), input2(7), c(7), sum(7), c(8));
	FA8: FullAdder port map (input1(8), input2(8), c(8), sum(8), c(9));
	FA9: FullAdder port map (input1(9), input2(9), c(9), sum(9), c(10));
	FA10: FullAdder port map (input1(10), input2(10), c(10), sum(10), c(11));
	FA11: FullAdder port map (input1(11), input2(11), c(11), sum(11), c(12));
	FA12: FullAdder port map (input1(12), input2(12), c(12), sum(12), c(13));
	FA13: FullAdder port map (input1(13), input2(13), c(13), sum(13), c(14));
	FA14: FullAdder port map (input1(14), input2(14), c(14), sum(14), c(15));
	FA15: FullAdder port map (input1(15), input2(15), c(15), sum(15), c(16));
	
	v <= c(15) XOR c(16);
	cout <= c(16);
	
end structural;

