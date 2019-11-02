library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity sec is
port ( en_min,clk_1,clr,sethour:in std_logic;
		 c,d:out std_logic_vector(3 downto 0);
		 enhour:out std_logic);
end sec;

architecture sec_arch of sec is
signal s1,s2:std_logic_vector(3 downto 0);
signal enhour1, enhour2:std_logic;
begin
process(clr,clk_1,sethour)
	begin
	if(clr='0')then
	s1<="0000";
	s2<="0000";
	elsif (rising_edge(en_min))then
		if(s1="0101"and s2="1001")then
			s1<="0000";
			s2<="0000";
			enhour1<='1';
		elsif s2="1001" then
			s1<=s1+1;
			s2<="0000";
			enhour1<='0';
		else
			s2<=s2+1;
			enhour1<='0';
		end if;
	end if;
end process;
c<=s2;
d<=s1;
enhour2<=((not sethour) and clk_1);
enhour<= enhour1 or enhour2;
end sec_arch; 	