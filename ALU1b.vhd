library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;

entity ALU1b is
port(input1, input2: in std_logic;
	  cin: in std_logic;
	  operation: in std_logic_vector(1 downto 0);
	  AInvert, BInvert: in std_logic;
	  output: out std_logic;
	  cout: out std_logic);
	  
end ALU1b;

architecture structural of ALU1b is

component ADD1b
port (input1, input2: in std_logic;
		cin: in std_logic;
		sum: out std_logic;
		cout: out std_logic);
end component;

component SUB1b
port (input1, input2: in std_logic;
		cin: in std_logic;
      		sum: out std_logic;
		cout: out std_logic);
end component;

component myAND2
port (in1, in2: in std_logic;
	out1: out std_logic);
end component;

component myOR2
port (in1, in2: in std_logic;
		out1: out std_logic);
end component;

component myXOR2
port (in1, in2: in std_logic;
		out1: out std_logic);
end component;

component myNOR
port (in1, in2: in std_logic;
		out1: out std_logic);
end component;

signal s0, s1, s2, s3, s4, s5: std_logic;
signal add_cout, sub_cout: std_logic;
begin  


	v0: ADD16b port map (input1, input2, cin, s0, add_cout);
	v1: SUB16b port map (input1, input2, cin, s1, sub_cout);
	v2: myAND2 port map (input1, input2, s2); 
	v3: myOR2 port map (input1, input2, s3);
	v4: myXOR2 port map (input1, input2, s4);
	v5: myNOR port map (input1, input2, s5);

	process(operation, AInvert, BInvert)
		begin
		case(operation) is
		when "00" =>
		if AInvert = '1' AND BInvert = '1' then 
			output <= s5; --nor
		else 
			output <= s2; --and
		end if;
		when "01" => 	
		output <= s3; --OR
		when "10" =>
		if BInvert = '1' AND cin = '1' then
			output <= s1; --sub
			cout <= sub_cout;
		else 
			output <= s0;--add 
			cout <= add_cout;
		end if;
		when "11" => 
		output <= s4; --xor 
		end case;
		
	end process;
end structural;
