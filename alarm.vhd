library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
entity alarm is
 
port(clk: in std_logic;
	  minute_in1 : in std_logic_vector(3 downto 0);
	  minute_in2 : in std_logic_vector(3 downto 0);
	  second_in1 : in std_logic_vector(3 downto 0);
	  second_in2 : in std_logic_vector(3 downto 0);
	  alarm : out std_logic);
end alarm;
architecture beh of alarm is
begin
process(minute_in1,second_in1,minute_in2,second_in2)
begin

if(minute_in1 = "0000"  and minute_in2 = "0000" ) then
if(second_in1 ="0001"and second_in2 ="0000")then
	alarm <= clk;
end if;
end if;
if(second_in1 ="0100") then
	alarm <= '1';
end if;
end process;
end beh;
