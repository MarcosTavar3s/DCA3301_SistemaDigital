library ieee;
use ieee.std_logic_1164.all;

--portas logicas
ENTITY Mux2x1Portas IS
PORT(e0, e1, sel0: IN BIT;
output_port: OUT BIT);
END Mux2x1Portas;

ARCHITECTURE behav OF Mux2x1Portas IS
	SIGNAL aux_neg: BIT;
	SIGNAL aux_and1: BIT;
	SIGNAL aux_and2: BIT;
BEGIN
	u1:aux_neg <= NOT sel0;
	u2:aux_and1 <= e0 and aux_neg;
	u3:aux_and2 <= e1 and sel0;
	u4:output_port <= aux_and1 or aux_and2;
END;
