library ieee;
use ieee.std_logic_1164.all;

ENTITY somador_completo IS
PORT(a_bit, b_bit, cin: IN std_logic;
S_bit, cout_bit :OUT std_logic);
END somador_completo;

ARCHITECTURE BEHAV OF somador_completo IS

BEGIN
	S_bit <= a_bit XOR b_bit xor cin;
	cout_bit <= (a_bit AND b_bit) OR (a_bit AND cin) OR (b_bit AND cin);
END ARCHITECTURE BEHAV;
