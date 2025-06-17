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
	u1: PortaAnd4Entradas(in1=>NOT(A4), in2=>NOT(A3), in3=>NOT(A2), in4=>NOT(A1) , saida_and=>a4n_a3n_a2n_a1n);
	u2: PortaAnd4Entradas(in1=>NOT(A4), in2=>NOT(A3), in3=>NOT(A2), in4=>A1 , saida_and=>a4n_a3n_a2n_a1);
	u3: PortaAnd4Entradas(in1=>NOT(A4), in2=>A3, in3=>A2, in4=>A1 , saida_and=>a4n_a3_a2_a1);
	u4: PortaAnd4Entradas(in1=>NOT(A4), in2=>NOT(A3), in3=>A2, in4=>NOT(A1), saida_and=>a4n_a3n_a2_a1n);
	u5: PortaAnd4Entradas(in1=>NOT(A4), in2=>NOT(A3), in3=>A2, in4=>A1 , saida_and=>a4n_a3n_a2_a1);
	u6: PortaAnd4Entradas(in1=>NOT(A4), in2=>A3, in3=>NOT(A2), in4=>NOT(A1) , saida_and=>a4n_a3_a2n_a1n);
	u7: PortaAnd4Entradas(in1=>NOT(A4), in2=>A3, in3=>NOT(A2), in4=>A1 , saida_and=>a4n_a3_a2n_a1);
	u8: PortaAnd4Entradas(in1=>A4, in2=>NOT(A3), in3=>NOT(A2), in4=>A1 , saida_and=>a4_a3n_a2n_a1);
	u9: PortaAnd4Entradas(in1=>NOT(A4), in2=>A3, in3=>A2, in4=>NOT(A1) , saida_and=>a4n_a3_a2_a1n);
	
-- saidas
	-- S0
	u10: PortaOr6Entradas(e1=>a4n_a3n_a2n_a1, e2=>a4n_a3_a2n_a1n, e3=>'1', e4=>'1', e5=>'1', e6=>'1', saida_or=>S0);
	-- S1
	u11: PortaOr6Entradas(e1=>a4n_a3_a2n_a1, e2=>a4n_a3_a2_a1n, e3=>'1', e4=>'1', e5=>'1', e6=>'1', saida_or=>S1);
  -- S2
	u12: S2<=a4n_a3n_a2_a1n;
  -- S3
  	u13: PortaOr6Entradas(e1=>a4n_a3n_a2n_a1, e2=>a4n_a3_a2n_a1n, e3=>a4n_a3_a2_a1, e4=>'1', e5=>'1', e6=>'1', saida_or=>S3);
  -- S4
   u14: PortaOr6Entradas(e1=>a4n_a3n_a2n_a1, e2=>a4n_a3n_a2_a1, e3=>a4n_a3_a2n_a1n, e4=>a4n_a3_a2n_a1, e5=>a4n_a3_a2_a1, e6=>a4_a3n_a2n_a1, saida_or=>S4);
  -- S5
   u15: PortaOr6Entradas(e1=>a4n_a3n_a2n_a1, e2=>a4n_a3n_a2_a1n, e3=>a4n_a3n_a2_a1, e4=>a4n_a3_a2_a1, e5=>'1', e6=>'1', saida_or=>S5);
  -- S6
   u16: PortaOr6Entradas(e1=>a4n_a3n_a2n_a1n, e2=>a4n_a3n_a2n_a1, e3=>a4n_a3_a2_a1, e4=>'1', e5=>'1', e6=>'1', saida_or=>S6);

	
 END ARCHITECTURE BEHAV;
