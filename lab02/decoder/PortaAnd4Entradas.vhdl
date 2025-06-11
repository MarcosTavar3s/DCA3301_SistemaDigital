library ieee;
use ieee.std_logic_1164.all;

ENTITY PortaAnd4Entradas IS

PORT(in1, in2, in3, in4 : IN BIT;
saida_and : OUT BIT);
END PortaAnd4Entradas;

ARCHITECTURE behav OF PortaAnd4Entradas IS
BEGIN
saida_and <= in1 and in2 and in3 and in4;
END ARCHITECTURE behav;
