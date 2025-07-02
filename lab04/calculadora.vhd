library ieee;
use ieee.std_logic_1164.all;

ENTITY calculadora IS
PORT(A, B: IN std_logic_vector(5 downto 0);
f: IN std_logic;
S: OUT std_logic_vector(5 downto 0);
cout:OUT BIT);
END calculadora;

ARCHITECTURE BEHAV OF calculadora IS
	SIGNAL aux_B: std_logic_vector(5 downto 0);
	signal f_vector : std_logic_vector(5 downto 0);
	
   COMPONENT somador_6bits IS
	  PORT(A_value, B_value: IN std_logic_vector(5 downto 0);
	  cin_inicial: IN std_logic;
	  output: OUT std_logic_vector(5 downto 0);
	  cout_soma :OUT BIT);
	END COMPONENT;
	
BEGIN
	-- vetor auxiliar para comparacao no and
	f_vector <= (others => f);
	aux_b <= (B and NOT(f_vector)) or (NOT(B) and f_vector);
	u1: somador_6bits PORT MAP(A_value=>A, B_value=>aux_B, cin_inicial=>f, output=>S, cout_soma=>cout);
	
END ARCHITECTURE BEHAV;
