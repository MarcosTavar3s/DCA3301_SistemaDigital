LIBRARY ieee;
USE ieee.std_logic_1164.all ;
USE ieee.numeric_std.all;

ENTITY projeto_final IS
	PORT(clock_cnt, clear_cnt, en_cnt, clock_reg: IN BIT;
	e, g, l:OUT BIT;
	cont: OUT INTEGER
	);
END;

ARCHITECTURE behav OF projeto_final IS

	COMPONENT comparador_magnitude IS
		PORT(A,B: IN INTEGER;
		A_lt_B:OUT BIT);
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
	
	-- sinais auxiliares para processamento do tempo
	SIGNAL tempo: INTEGER;
	SIGNAL segundos_m, segundos_c, segundos_d, segundos_u: INTEGER;
	SIGNAL bits_segundos_m, bits_segundos_c, bits_segundos_d, bits_segundos_u: std_logic_vector(3 downto 0);
	-- auxiliar para comparacao (<3600)
	SIGNAL menor_3600: BIT;
	
BEGIN

	-- contador
	u1: contador PORT MAP(clk_cnt=>clock_cnt, cnt=>en_cnt, clr=>clear_cnt, num=>tempo);
	u2: comparador_magnitude PORT MAP(A=>tempo, B=>3600, A_lt_B=>menor_3600);
	
	-- converte para a saida em cada display
	u3: conversor PORT MAP(segundos=>tempo, s_m=>segundos_m, s_c=>segundos_c, s_d=>segundos_d, s_u=>segundos_u);
	
	bits_segundos_m <= std_logic_vector(to_unsigned(segundos_m, 4));
	bits_segundos_c <= std_logic_vector(to_unsigned(segundos_c, 4));
	bits_segundos_d <= std_logic_vector(to_unsigned(segundos_d, 4));
	bits_segundos_u <= std_logic_vector(to_unsigned(segundos_u, 4));
	
	-- armazena no registrador
	u4: registrador PORT MAP(c=>clock_reg, q11=>'0', q10=>'0')
	
	--
	
	
END; 
