LIBRARY ieee;
USE ieee.std_logic_1164.all ;
 
ENTITY projeto_final IS
	PORT(C,i: IN BIT;
	e, g, l:OUT BIT;
	cont: OUT INTEGER
	);
END;

ARCHITECTURE behav OF projeto_final IS

	COMPONENT comparador_magnitude IS
		PORT(A,B: IN INTEGER;
		A_et_B, A_lt_B, A_gt_B:OUT BIT);
	END COMPONENT;
	
	COMPONENT registrador IS
		PORT(c, i11, i10, i9, i8, i7, i6, i5, i4, i3, i2, i1, i0:IN BIT;
		q11, q10, q9, q8, q7, q6, q5, q4, q3, q2, q1, q0:OUT BIT);
	END COMPONENT;
	
	COMPONENT contador IS
	PORT(clk_cnt, cnt, clr_cnt: IN BIT;
	num: OUT INTEGER);
	END COMPONENT;
	
	COMPONENT conversor IS
	PORT(segundos: IN INTEGER;
	s_m, s_c, s_d, s_u:OUT INTEGER);
	END COMPONENT;
	
	signal auxa, auxb: INTEGER;
	
BEGIN
	auxa<=6;
	auxb<=9;
	
	u1: contador PORT MAP(clk_cnt=>c, cnt=>'1', clr_cnt=>'0', num=>cont);
	
END; 
