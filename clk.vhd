library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity clk is
port(clk_50:in std_logic;
     clk_1,clk_1000:out std_logic);
end clk;

architecture clk_arch of clk is
signal temp,temp1,temp2 :std_logic;
begin
process(clk_50)
	variable count: integer range 0 to 25000000 := 0;
	begin
		if(rising_edge(clk_50)) then
		if(count = 25000000) then				
				count := 0;
				temp <= not temp;
			else
				count := count + 1;
			end if;
		end if;
	end process;
	
process(clk_50)
	variable count1: integer range 0 to 25000:= 0;
	begin
		if(rising_edge(clk_50)) then
		if(count1 = 2500) then				
				count1 := 0;
				temp1 <= not temp1;
			else
				count1 := count1 + 1;
			end if;
		end if;
	end process;

clk_1<=temp1;
clk_1000<=temp;

end clk_arch;