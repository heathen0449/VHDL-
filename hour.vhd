library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity hour is
port(	en_hour,clr:in std_logic;
      e,f:out std_logic_vector(3 downto 0));
end hour;

architecture hour_arch of hour is 
signal s1,s2:std_logic_vector(3 downto 0);
begin
process(clr,en_hour)
	begin
	if(clr='0')then
	s1<="0000";
	s2<="0000";
	elsif (rising_edge(en_hour)) then
		if(s1="0010"and s2="0011")then
			s1<="0000";
			s2<="0000";
		elsif(s2="1001")then
			s1<=s1+1;
			s2<="0000";
		else
			s2<=s2+1;
		end if;
   end if;
end process;
e<=s2;
f<=s1;
end hour_arch;
	