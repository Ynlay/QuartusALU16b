library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;

entity ALU16b is
port(input1, input2: in std_logic_vector(15 downto 0);
	  cin: in std_logic;
	  opcode: in std_logic_vector(2 downto 0);
	  output: out std_logic_vector(15 downto 0);
	  cout, v: out std_logic);
	  
end ALU16b;

architecture structural of ALU16b is

component ALU1b
port(input1, input2: in std_logic;
	  cin: in std_logic;
	  operation: in std_logic_vector(1 downto 0);
	  AInvert, BInvert: in std_logic;
	  output: out std_logic;
	  cout: out std_logic);
end component; 


signal and_output, add_output, sub_output, nor_output, xor_output, or_output : std_logic;

signal c_and, c_sub, c_or, c_nor, c_xor, c_add : std_logic_vector(16 downto 1);

begin 

	
	A0: ALU1b port map (input1(0), input2(0), cin, "00", '0', '0', and_output, c_and(1));
	A1: ALU1b port map (input1(1), input2(1), c_and(1), "00", '0', '0', and_output, c_and(2));
	A2: ALU1b port map (input1(2), input2(2), c_and(2), "00", '0', '0', and_output, c_and(3));
	A3: ALU1b port map (input1(3), input2(3), c_and(3), "00", '0', '0', and_output, c_and(4));
	A4: ALU1b port map (input1(4), input2(4), c_and(4), "00", '0', '0', and_output, c_and(5));
	A5: ALU1b port map (input1(5), input2(5), c_and(5), "00", '0', '0', and_output, c_and(6));
	A6: ALU1b port map (input1(6), input2(6), c_and(6), "00", '0', '0', and_output, c_and(7));
	A7: ALU1b port map (input1(7), input2(7), c_and(7), "00", '0', '0', and_output, c_and(8));
	A8: ALU1b port map (input1(8), input2(8), c_and(8), "00", '0', '0', and_output, c_and(9));
	A9: ALU1b port map (input1(9), input2(9), c_and(9), "00", '0', '0', and_output, c_and(10));
	A10: ALU1b port map (input1(10), input2(10), c_and(10), "00", '0', '0', and_output, c_and(11));
	A11: ALU1b port map (input1(11), input2(11), c_and(11), "00", '0', '0', and_output, c_and(12));
	A12: ALU1b port map (input1(12), input2(12), c_and(12), "00", '0', '0', and_output, c_and(13));
	A13: ALU1b port map (input1(13), input2(13), c_and(13), "00", '0', '0', and_output, c_and(14));
	A14: ALU1b port map (input1(14), input2(14), c_and(14), "00", '0', '0', and_output, c_and(15));
	A15: ALU1b port map (input1(15), input2(15), c_and(15), "00", '0', '0', and_output, c_and(16));

	A16: ALU1b port map (input1(0), input2(0), cin, "01", '0', '0', or_output, c_or(1));
	A17: ALU1b port map (input1(1), input2(1), c_or(1), "01", '0', '0', or_output, c_or(2));
	A18: ALU1b port map (input1(2), input2(2), c_or(2), "01", '0', '0', or_output, c_or(3));
	A19: ALU1b port map (input1(3), input2(3), c_or(3), "01", '0', '0', or_output, c_or(4));
	A20: ALU1b port map (input1(4), input2(4), c_or(4), "01", '0', '0', or_output, c_or(5));
	A21: ALU1b port map (input1(5), input2(5), c_or(5), "01", '0', '0', or_output, c_or(6));
	A22: ALU1b port map (input1(6), input2(6), c_or(6), "01", '0', '0', or_output, c_or(7));
	A23: ALU1b port map (input1(7), input2(7), c_or(7), "01", '0', '0', or_output, c_or(8));
	A24: ALU1b port map (input1(8), input2(8), c_or(8), "01", '0', '0', or_output, c_or(9));
	A25: ALU1b port map (input1(9), input2(9), c_or(9), "01", '0', '0', or_output, c_or(10));
	A26: ALU1b port map (input1(10), input2(10), c_or(10), "01", '0', '0', or_output, c_or(11));
	A27: ALU1b port map (input1(11), input2(11), c_or(11), "01", '0', '0', or_output, c_or(12));
	A28: ALU1b port map (input1(12), input2(12), c_or(12), "01", '0', '0', or_output, c_or(13));
	A29: ALU1b port map (input1(13), input2(13), c_or(13), "01", '0', '0', or_output, c_or(14));
	A30: ALU1b port map (input1(14), input2(14), c_or(14), "01", '0', '0', or_output, c_or(15));
	A31: ALU1b port map (input1(15), input2(15), c_or(15), "01", '0', '0', or_output, c_or(16));

	A32: ALU1b port map (input1(0), input2(0), cin, "11", '0', '0', add_output, c_add(1));
	A33: ALU1b port map (input1(1), input2(1), c_add(1), "11", '0', '0', add_output, c_add(2));
	A34: ALU1b port map (input1(2), input2(2), c_add(2), "11", '0', '0', add_output, c_add(3));
	A35: ALU1b port map (input1(3), input2(3), c_add(3), "11", '0', '0', add_output, c_add(4));
	A36: ALU1b port map (input1(4), input2(4), c_add(4), "11", '0', '0', add_output, c_add(5));
	A37: ALU1b port map (input1(5), input2(5), c_add(5), "11", '0', '0', add_output, c_add(6));
	A38: ALU1b port map (input1(6), input2(6), c_add(6), "11", '0', '0', add_output, c_add(7));
	A39: ALU1b port map (input1(7), input2(7), c_add(7), "11", '0', '0', add_output, c_add(8));
	A40: ALU1b port map (input1(8), input2(8), c_add(8), "11", '0', '0', add_output, c_add(9));
	A41: ALU1b port map (input1(9), input2(9), c_add(9), "11", '0', '0', add_output, c_add(10));
	A42: ALU1b port map (input1(10), input2(10), c_add(10), "11", '0', '0', add_output, c_add(11));
	A43: ALU1b port map (input1(11), input2(11), c_add(11), "11", '0', '0', add_output, c_add(12));
	A44: ALU1b port map (input1(12), input2(12), c_add(12), "11", '0', '0', add_output, c_add(13));
	A45: ALU1b port map (input1(13), input2(13), c_add(13), "11", '0', '0', add_output, c_add(14));
	A46: ALU1b port map (input1(14), input2(14), c_add(14), "11", '0', '0', add_output, c_add(15));
	A47: ALU1b port map (input1(15), input2(15), c_add(15), "11", '0', '0', add_output, c_add(16));

	A48: ALU1b port map (input1(0), input2(0), cin, "11", '0', '1', sub_output, c_sub(1));
	A49: ALU1b port map (input1(1), input2(1), c_sub(1), "11", '0', '1', sub_output, c_sub(2));
	A50: ALU1b port map (input1(2), input2(2), c_sub(2), "11", '0', '1', sub_output, c_sub(3));
	A51: ALU1b port map (input1(3), input2(3), c_sub(3), "11", '0', '1', sub_output, c_sub(4));
	A52: ALU1b port map (input1(4), input2(4), c_sub(4), "11", '0', '1', sub_output, c_sub(5));
	A53: ALU1b port map (input1(5), input2(5), c_sub(5), "11", '0', '1', sub_output, c_sub(6));
	A54: ALU1b port map (input1(6), input2(6), c_sub(6), "11", '0', '1', sub_output, c_sub(7));
	A55: ALU1b port map (input1(7), input2(7), c_sub(7), "11", '0', '1', sub_output, c_sub(8));
	A56: ALU1b port map (input1(8), input2(8), c_sub(8), "11", '0', '1', sub_output, c_sub(9));
	A57: ALU1b port map (input1(9), input2(9), c_sub(9), "11", '0', '1', sub_output, c_sub(10));
	A58: ALU1b port map (input1(10), input2(10), c_sub(10), "11", '0', '1', sub_output, c_sub(11));
	A59: ALU1b port map (input1(11), input2(11), c_sub(11), "11", '0', '1', sub_output, c_sub(12));
	A60: ALU1b port map (input1(12), input2(12), c_sub(12), "11", '0', '1', sub_output, c_sub(13));
	A61: ALU1b port map (input1(13), input2(13), c_sub(13), "11", '0', '1', sub_output, c_sub(14));
	A62: ALU1b port map (input1(14), input2(14), c_sub(14), "11", '0', '1', sub_output, c_sub(15));
	A63: ALU1b port map (input1(15), input2(15), c_sub(15), "11", '0', '1', sub_output, c_sub(16));

	A64: ALU1b port map (input1(0), input2(0), cin, "00", '1', '1', nor_output, c_nor(1));
	A65: ALU1b port map (input1(1), input2(1), c_nor(1), "00", '1', '1', nor_output, c_nor(2));
	A66: ALU1b port map (input1(2), input2(2), c_nor(2), "00", '1', '1', nor_output, c_nor(3));
	A67: ALU1b port map (input1(3), input2(3), c_nor(3), "00", '1', '1', nor_output, c_nor(4));
	A68: ALU1b port map (input1(4), input2(4), c_nor(4), "00", '1', '1', nor_output, c_nor(5));
	A69: ALU1b port map (input1(5), input2(5), c_nor(5), "00", '1', '1', nor_output, c_nor(6));
	A70: ALU1b port map (input1(6), input2(6), c_nor(6), "00", '1', '1', nor_output, c_nor(7));
	A71: ALU1b port map (input1(7), input2(7), c_nor(7), "00", '1', '1', nor_output, c_nor(8));
	A72: ALU1b port map (input1(8), input2(8), c_nor(8), "00", '1', '1', nor_output, c_nor(9));
	A73: ALU1b port map (input1(9), input2(9), c_nor(9), "00", '1', '1', nor_output, c_nor(10));
	A74: ALU1b port map (input1(10), input2(10), c_nor(10), "00", '1', '1', nor_output, c_nor(11));
	A75: ALU1b port map (input1(11), input2(11), c_nor(11), "00", '1', '1', nor_output, c_nor(12));
	A76: ALU1b port map (input1(12), input2(12), c_nor(12), "00", '1', '1', nor_output, c_nor(13));
	A77: ALU1b port map (input1(13), input2(13), c_nor(13), "00", '1', '1', nor_output, c_nor(14));
	A78: ALU1b port map (input1(14), input2(14), c_nor(14), "00", '1', '1', nor_output, c_nor(15));
	A79: ALU1b port map (input1(15), input2(15), c_nor(15), "00", '1', '1', nor_output, c_nor(16));

	A80: ALU1b port map (input1(0), input2(0), cin, "10", '0', '0', xor_output, c_xor(1));
	A81: ALU1b port map (input1(1), input2(1), c_xor(1), "10", '0', '0', xor_output, c_xor(2));
	A82: ALU1b port map (input1(2), input2(2), c_xor(2), "10", '0', '0', xor_output, c_xor(3));
	A83: ALU1b port map (input1(3), input2(3), c_xor(3), "10", '0', '0', xor_output, c_xor(4));
	A84: ALU1b port map (input1(4), input2(4), c_xor(4), "10", '0', '0', xor_output, c_xor(5));
	A85: ALU1b port map (input1(5), input2(5), c_xor(5), "10", '0', '0', xor_output, c_xor(6));
	A86: ALU1b port map (input1(6), input2(6), c_xor(6), "10", '0', '0', xor_output, c_xor(7));
	A87: ALU1b port map (input1(7), input2(7), c_xor(7), "10", '0', '0', xor_output, c_xor(8));
	A88: ALU1b port map (input1(8), input2(8), c_xor(8), "10", '0', '0', xor_output, c_xor(9));
	A89: ALU1b port map (input1(9), input2(9), c_xor(9), "10", '0', '0', xor_output, c_xor(10));
	A90: ALU1b port map (input1(10), input2(10), c_xor(10), "10", '0', '0', xor_output, c_xor(11));
	A91: ALU1b port map (input1(11), input2(11), c_xor(11), "10", '0', '0', xor_output, c_xor(12));
	A92: ALU1b port map (input1(12), input2(12), c_xor(12), "10", '0', '0', xor_output, c_xor(13));
	A93: ALU1b port map (input1(13), input2(13), c_xor(13), "10", '0', '0', xor_output, c_xor(14));
	A94: ALU1b port map (input1(14), input2(14), c_xor(14), "10", '0', '0', xor_output, c_xor(15));
	A95: ALU1b port map (input1(15), input2(15), c_xor(15), "10", '0', '0', xor_output, c_xor(16));
	
	process(opcode)
		begin
		case(opcode) is
		when "000" =>
			output <= and_output; --AND
		when "001" => 
			output <= or_output; --OR
		when "010" => 
			output <= sub_output; --SUB
			cout <= c_sub(16);
			v <= c_sub(15) XOR c_sub(16);
		when "011" => 
			output <= add_output; --ADD
			cout <= c_add(16);
			v <= c_add(15) XOR c_add(16);
		when "100" => 
			output <= xor_output; --XOR
		when "101" => 
			output <= nor_output; --NOR
		when others => 
			output <= "0";
		end case;
	end process;
end structural;
