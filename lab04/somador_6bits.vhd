library ieee;
use ieee.std_logic_1164.all;

ENTITY somador_6bits IS
PORT(A_value, B_value: IN std_logic_vector(5 downto 0);
	  cin_inicial: IN std_logic;
	  output: OUT std_logic_vector(5 downto 0);
	  cout_soma :OUT std_logic);
END somador_6bits;

ARCHITECTURE BEHAV OF somador_6bits IS
	signal cins: std_logic_vector(5 downto 0);
	
	COMPONENT somador_completo IS
		PORT(a_bit, b_bit, cin: IN std_logic;
		S_bit, cout_bit :OUT std_logic);
	END COMPONENT;

BEGIN
	u1: somador_completo PORT MAP(a_bit=>A_value(0), b_bit=>B_value(0), cin=>cin_inicial, S_bit=>output(0), cout_bit=>cins(0));
	u2: somador_completo PORT MAP(a_bit=>A_value(1), b_bit=>B_value(1), cin=>cins(0), S_bit=>output(1), cout_bit=>cins(1));
	u3: somador_completo PORT MAP(a_bit=>A_value(2), b_bit=>B_value(2), cin=>cins(1), S_bit=>output(2), cout_bit=>cins(2));
	u4: somador_completo PORT MAP(a_bit=>A_value(3), b_bit=>B_value(3), cin=>cins(2), S_bit=>output(3), cout_bit=>cins(3));
	u5: somador_completo PORT MAP(a_bit=>A_value(4), b_bit=>B_value(4), cin=>cins(3), S_bit=>output(4), cout_bit=>cins(4));
	u6: somador_completo PORT MAP(a_bit=>A_value(5), b_bit=>B_value(5), cin=>cins(4), S_bit=>output(5), cout_bit=>cout_soma);
	
END ARCHITECTURE BEHAV;
