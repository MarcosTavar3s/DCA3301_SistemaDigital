LIBRARY ieee;
USE ieee.std_logic_1164.all ;
USE ieee.numeric_std.all;

ENTITY projeto_final IS
	PORT(clock_cnt, clear_cnt, en_cnt, clock_reg, clear_reg: IN BIT;
	saida_cnt: OUT std_logic_vector(11 downto 0);
	saida_cnt_m, saida_cnt_c, saida_cnt_d, saida_cnt_u: OUT std_logic_vector(3 downto 0);
	l:OUT BIT;
	cont: OUT INTEGER
	);
END;

ARCHITECTURE behav OF projeto_final IS

	COMPONENT comparador_magnitude IS
		PORT(A,B: IN INTEGER;
		A_lt_B:OUT BIT);
	END COMPONENT;
	
	COMPONENT registrador IS
		PORT(c, clr_registrador, ld_registrador:IN BIT;
		i: IN std_logic_vector(11 DOWNTO 0);
		q: OUT std_logic_vector(11 DOWNTO 0));
	END COMPONENT;
	
	COMPONENT registrador4bits IS
	 PORT(c4bits, clr_registrador4bits, ld_registrador4bits:IN BIT;
	 i4bits : IN std_logic_vector(3 DOWNTO 0);
	 q4bits : OUT std_logic_vector(3 DOWNTO 0));
	END COMPONENT;
	
	COMPONENT contador IS
	PORT(clk_cnt, cnt, clr_cnt: IN BIT;
	num: OUT INTEGER);
	END COMPONENT;
	
	COMPONENT conversor IS
	PORT(segundos: IN std_logic_vector(11 downto 0);
	s_m, s_c, s_d, s_u:OUT std_logic_vector(3 downto 0));
	END COMPONENT;
	
	-- sinais auxiliares para processamento do tempo
	SIGNAL tempo: INTEGER;
	SIGNAL bits_segundos, bits_segundos_reg: std_logic_vector(11 downto 0);
	SIGNAL bits_segundos_m, bits_segundos_c, bits_segundos_d, bits_segundos_u: std_logic_vector(3 downto 0);
	-- auxiliar para comparacao (<3600)
	SIGNAL menor_3600: BIT;
	
BEGIN

	-- contador
	u1: contador PORT MAP(clk_cnt=>clock_cnt, cnt=>en_cnt, clr_cnt=>clear_cnt, num=>tempo);
	u2: comparador_magnitude PORT MAP(A=>tempo, B=>3600, A_lt_B=>menor_3600);
	l<=menor_3600;
	-- converte o numero inteiro para vetor de bits
	bits_segundos <= std_logic_vector(to_unsigned(tempo, 12));
	
	
	-- registrador do segundos
	u4: registrador PORT MAP(c=>clock_reg, ld_registrador=>menor_3600, clr_registrador=>clear_reg, i=>bits_segundos, q=>bits_segundos_reg);
	saida_cnt <= bits_segundos_reg;
	
	-- separacao em unidade, dezena, centena e milhar
	u5: conversor PORT MAP(segundos=>bits_segundos_reg, s_m=>bits_segundos_m, s_c=>bits_segundos_c, s_d=>bits_segundos_d, s_u=>bits_segundos_u);
	
	-- registrador de unidade, dezena, centena e milhar
	u6: registrador4bits PORT MAP(c4bits=>clock_reg, ld_registrador4bits=>menor_3600, clr_registrador4bits=>clear_reg, i4bits=>bits_segundos_m, q4bits=>saida_cnt_m);
	u7: registrador4bits PORT MAP(c4bits=>clock_reg, ld_registrador4bits=>menor_3600, clr_registrador4bits=>clear_reg, i4bits=>bits_segundos_c, q4bits=>saida_cnt_c);
	u8: registrador4bits PORT MAP(c4bits=>clock_reg, ld_registrador4bits=>menor_3600, clr_registrador4bits=>clear_reg, i4bits=>bits_segundos_d, q4bits=>saida_cnt_d);
	u9: registrador4bits PORT MAP(c4bits=>clock_reg, ld_registrador4bits=>menor_3600, clr_registrador4bits=>clear_reg, i4bits=>bits_segundos_u, q4bits=>saida_cnt_u);

	-- decoder
	
	
END; 
