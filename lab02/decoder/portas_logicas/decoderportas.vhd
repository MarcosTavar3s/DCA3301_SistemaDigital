library ieee;
use ieee.std_logic_1164.all;

ENTITY decoderportas IS
PORT(a1, a2, a3, a4: IN BIT;
S0, S1, S2, S3, S4, S5, S6 :OUT BIT);
END decoderportas;

ARCHITECTURE BEHAV OF decoderportas IS
	SIGNAL a4n: BIT;
	SIGNAL a3n: BIT;
	SIGNAL a2n: BIT;
	SIGNAL a1n: BIT;
	
BEGIN
	-- sinais auxiliares
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
