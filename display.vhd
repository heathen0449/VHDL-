library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
entity display is
port ( a1,b1,c1,d1,e1,f1:in std_logic_vector(3 downto 0);
       clk_1000:in std_logic;
		 lgd:out std_logic_vector(5 downto 0);
		 dig:out std_logic_vector(7 downto 0));
end entity;

architecture display_arch of display is
signal fa :std_logic_vector(5 downto 0):="000001";
signal fb :std_logic_vector(3 downto 0);
signal fc :std_logic_vector(5 downto 0);
begin
process(clk_1000)
begin
	if(rising_edge(clk_1000))then
		if (fa="100000") then fa<="000001";
		else fa<=fa(4 downto 0)&fa(5);
		end if;
	end if;
	 fc<= not fa;
case fc is
	when "111110" =>  fb<=b1;
	when "111101" =>  fb<=a1;
	when "111011" =>  fb<=d1;
	when "110111" =>  fb<=c1;
	when "101111" =>  fb<=f1;
	when "011111" =>  fb<=e1;
	when others => fb<="0000";
	end case;
end process;
lgd<=fc;
dig<= not x"3F" when fb ="0000" else
      not x"06" when fb = "0001" else
		not x"5B" when fb = "0010" else
		not x"4F" when fb = "0011" else
		not x"66" when fb = "0100" else
		not x"6D" when fb = "0101" else
		not x"7D" when fb = "0110" else
		not x"07" when fb = "0111" else
		not x"7F" when fb = "1000" else
		not x"6F" when fb = "1001" else
		x"00";
end display_arch;
	
	
		

		