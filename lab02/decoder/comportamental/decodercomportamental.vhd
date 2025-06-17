library ieee;
use ieee.std_logic_1164.all;

ENTITY decodercomportamental IS
PORT(A1, A2, A3, A4: IN BIT;
S0, S1, S2, S3, S4, S5, S6 :OUT BIT);
END decodercomportamental;

ARCHITECTURE BEHAV OF decodercomportamental IS
	SIGNAL out_aux: BIT_VECTOR(6 DOWNTO 0);
	SIGNAL in_aux: BIT_VECTOR(3 DOWNTO 0);

BEGIN
	in_aux <= A4 & A3 & A2 & A1; -- concatenacao dos sinais

	WITH in_aux SELECT
		out_aux <= "1111001" WHEN "0001", -- 1
					  "0100100" WHEN "0010", -- 2
					  "0110000" WHEN "0011", -- 3
					  "0011001" WHEN "0100", -- 4
					  "0010010" WHEN "0101", -- 5
					  "0000010" WHEN "0110", -- 6
					  "1111000" WHEN "0111", -- 7
					  "0000000" WHEN "1000", -- 8
					  "0010000" WHEN "1001", -- 9
					  "1000000" WHEN OTHERS; -- 0 para qualquer numero que nao seja 1 ate 9
		
	S6 <= out_aux(6);
	S5 <= out_aux(5);
	S4 <= out_aux(4);
	S3 <= out_aux(3);
	S2 <= out_aux(2);
	S1 <= out_aux(1);
	S0 <= out_aux(0);
	
 END ARCHITECTURE BEHAV;
