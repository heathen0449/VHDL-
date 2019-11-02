library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity min is --秒钟
port(
			clk_1,set_min,clr:in std_logic;
			a,b:out std_logic_vector(3 downto 0);
			en_min:out std_logic);
end min;

architecture min_arch of min is
signal s1,s2:std_logic_vector( 3 downto 0);
signal edmin1,edmin2 :std_logic;
begin
process(clk_1,clr,set_min)
begin
	if(clr='0')then
	s1<="0000";
	s2<="0000";
	elsif (rising_edge(clk_1))then
		if(s1="0101"and s2="1001")then
			edmin1<='1';
			s1<="0000";
			s2<="0000";
		elsif s2="1001" then
			s1<=s1+1;
			s2<="0000";
			edmin1<='0';
		else
			s2<=s2+1;
			edmin1<='0';
		end if;
	end if;
end process;
a<=s2;
b<=s1;
edmin2<=(not(set_min) and clk_1);
en_min<=(edmin1 or edmin2);
end min_arch; 	
			
	
			
			
			