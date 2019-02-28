library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;

entity myNOR is
port(in1, in2: in std_logic;
	  out1: out std_logic);
end myNOR;

architecture behavioral of myNOR is
begin
	out1 <= in1 NOR in2;
end behavioral;