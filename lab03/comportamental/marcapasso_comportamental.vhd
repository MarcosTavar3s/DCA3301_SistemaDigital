library ieee;
use ieee.std_logic_1164.all;

entity marcapasso_comportamental is
	port(s, z, clk: in std_logic;
		  p, t: out std_logic
	);
	
end marcapasso_comportamental;

architecture behavior of marcapasso_comportamental is
	type statetype is
	(S_On1, S_On2, S_on3);
	signal currentstate, nextstate: statetype;
	
begin
	statereg: process(clk)
	begin
		if (clk='1' and clk ' event) then
			currentstate <= nextstate;
		end if;
	end process;
	
	comblogic: process (currentstate, s, z)
	begin 
		case currentstate is
			when S_On1 =>
				t <= '1';
				p <= '0';
				nextstate <= S_On2;
			when S_On2 =>
				t <= '0';
				p <= '0';
				
				if (s = '0' and z='1') then
						nextstate <= S_On3;
					--end if;
				else
					nextstate <= S_On1;
				end if;
				
			when S_On3 =>
				t <= '0';
				p <= '1';
				nextstate <= S_On1;
		end case;
		
	end process;	
	
end behavior;
