library ieee;
use ieee.std_logic_1164.all;

ENTITY decoder IS
PORT(a:IN std_logic_vector(3 DOWNTO 0);
S0, S1, S2, S3, S4, S5, S6 :OUT std_logic);
END decoder;

ARCHITECTURE BEHAV OF decoder IS
	SIGNAL a4, a3, a2, a1: std_logic;
	SIGNAL a4n, a3n, a2n, a1n: std_logic;
	
BEGIN
	-- sinais auxiliares
	a4 <= a(0);
	a3 <= a(1);
	a2 <= a(2);
	a1 <= a(3);
	a4n <= NOT(A4);
	a3n <= NOT(A3);
	a2n <= NOT(A2);
	a1n <= NOT(A1);
	
	-- saidas
	S0 <= (a4n and a3n and a2n and a1) or (a4n and a3 and a2n and a1n);
	S1 <= (a4n and a3 and a2n and a1) or  (a4n and a3 and a2 and a1n);
	S2 <= a4n and a3n and a2 and a1n;
	S3 <= (a4n and a3n and a2n and a1) or (a4n and a3 and a2n and a1n) or (a4n and a3 and a2 and a1);
	S4 <= (a4n and a1) or (a4n and a3 and a2n and a1) or (a4 and a3n and a2n and a1) or (a4n and a3 and a2n and a1n);
	S5 <= (a4n and a3n and a2n and a1) or (a4n and a3n and a2) or (a4n and a3 and a2 and a1);
	S6 <= (a4n and a3n and a2n and a1n) or (a4n and a3n and a2n and a1) or (a4n and a3 and a2 and a1) or (a4 and a2) or (a4 and a3);						
	
 END ARCHITECTURE BEHAV;
