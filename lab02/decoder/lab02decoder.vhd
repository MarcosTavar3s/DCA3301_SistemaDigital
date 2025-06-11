library ieee;
use ieee.std_logic_1164.all;

ENTITY lab02decoder IS
PORT(A1, A2, A3, A4: IN BIT;
S0, S1, S2, S3, S4, S5, S6 :OUT BIT);
END lab02decoder;

ARCHITECTURE BEHAV OF lab02decoder IS
	SIGNAL a4n_a3n_a2n_a1n: BIT;
	SIGNAL a4n_a3n_a2n_a1: BIT;
	SIGNAL a4n_a3_a2_a1: BIT;
	SIGNAL a4n_a3n_a2_a1n: BIT;
	SIGNAL a4n_a3n_a2_a1: BIT;
	SIGNAL a4n_a3_a2n_a1n: BIT;
	SIGNAL a4n_a3_a2n_a1: BIT;
	SIGNAL a4_a3n_a2n_a1: BIT;
	SIGNAL a4n_a3_a2_a1n: BIT;
	
	COMPONENT PortaAnd4Entradas IS
	PORT(in1, in2, in3, in4 : IN BIT;
	saida_and : OUT BIT);
	END COMPONENT;
	
	COMPONENT PortaOr6Entradas IS
	PORT(e1, e2, e3, e4, e5, e6 : IN BIT;
	saida_or : OUT BIT);
	END COMPONENT;

BEGIN
-- expressoes auxiliares
	u1: PortaAnd4Entradas
	
-- saidas


 END ARCHITECTURE BEHAV;
