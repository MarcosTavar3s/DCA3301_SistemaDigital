library ieee;
use ieee.std_logic_1164.all;

ENTITY alu IS
PORT(
A, B: IN std_logic_vector(5 downto 0);
x,y,z: IN std_logic;
cout: OUT std_logic;
S: OUT std_logic_vector(5 downto 0)
);
END alu;

ARCHITECTURE BEHAV OF alu IS
	SIGNAL aux_b: std_logic_vector(5 downto 0);
	SIGNAL xn_yn_zn, xn_yn_z, xn_y_zn, xn_y_z: std_logic_vector(5 downto 0);
	SIGNAL x_yn_zn, x_yn_z, x_y_zn, x_y_z: std_logic_vector(5 downto 0);
   SIGNAL aux_cin: std_logic;


	COMPONENT somador_6bits IS
	  PORT(A_value, B_value: IN std_logic_vector(5 downto 0);
	  cin_inicial: IN std_logic;
	  output: OUT std_logic_vector(5 downto 0);
	  cout_soma :OUT std_logic);
	END COMPONENT;	
	
BEGIN
	xn_yn_zn <= (others=>(not(x) and not(y) and not(z)));
	xn_yn_z <= (others=>(not(x) and not(y) and z));
	xn_y_zn <= (others=>(not(x) and y and not(z)));
	xn_y_z <= (others=>(not(x) and y and z));
	x_yn_zn <= (others=>(x and not(y) and not(z)));
	x_yn_z <= (others=>(x and not(y) and z));
	x_y_zn <= (others=>(x and y and not(z)));
	x_y_z <= (others=>(x and y and z));
	
	aux_cin <= (not(x) and not(y) and z) or (x and not(y) and z) or (x and y and z);
	
	aux_b <= (xn_yn_zn and B) or (xn_yn_z and not(B)) or (xn_y_zn and "000001") or (xn_y_z and "000000") or
	(x_yn_zn and B) or (x_yn_z and B) or (x_y_zn and B) or (x_y_z and "111111");
	
	u1: somador_6bits PORT MAP(A_value=>A, B_value=>aux_b, cin_inicial=>aux_cin, output=>S, cout_soma=>cout);
	

	
END ARCHITECTURE BEHAV;
