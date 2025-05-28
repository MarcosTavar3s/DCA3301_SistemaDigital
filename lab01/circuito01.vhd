library ieee;
use ieee.std_logic_1164.all;

ENTITY circuito01 IS
PORT(A,B,C: IN BIT;
S1, S2 :OUT BIT);
END circuito01;

ARCHITECTURE BEHAV OF circuito01 IS
	SIGNAL aux1: BIT; -- auxiliar para a xor
	SIGNAL aux2: BIT; -- not de A
	SIGNAL aux3: BIT; -- not de B
	SIGNAL aux4: BIT; -- auxilar para A'BC
	SIGNAL aux5: BIT; -- auxiliar para AB
	SIGNAL aux6: BIT; -- auxilar para AB'C
	
	COMPONENT PortaAnd3Entradas IS
	PORT(in1,in2,in3 : IN BIT;
	saida_and : OUT BIT);
	END COMPONENT;
	
	COMPONENT PortaOr3Entradas IS
	PORT(e1,e2,e3 : IN BIT;
	saida_or : OUT BIT);
	END COMPONENT;
	
	COMPONENT PortaXor2Entradas IS
	PORT(i1,i2: IN BIT;
	saida_xor : OUT BIT);
	END COMPONENT;
	
BEGIN
-- negacoes das portas
 u1: aux2 <= not A;
 u2: aux3 <= not B;
-- saida S1
 u3: PortaXor2Entradas PORT MAP(i1=>A, i2 =>B, saida_xor=>aux1); -- A xor B
 u4: PortaXor2Entradas PORT MAP(i1=>aux1, i2 =>C, saida_xor=>S2); -- (A xor B) xor C
 -- saida S2
 u5: PortaAnd3Entradas PORT MAP(in1=>A, in2=>B, in3=>'1', saida_and=>aux4); -- A'BC
 u6: PortaAnd3Entradas PORT MAP(in1=>A, in2=>C, in3=>'1', saida_and=>aux5); -- AB
 u7: PortaAnd3Entradas PORT MAP(in1=>B, in2=>C, in3=>'1', saida_and=>aux6); -- AB'C
 u8: PortaOr3Entradas PORT MAP(e1=>aux4, e2=>aux5, e3=>aux6, saida_or=>S1); -- A'BC + AB +AB'C
 END ARCHITECTURE BEHAV;
