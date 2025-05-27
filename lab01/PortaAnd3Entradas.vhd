library ieee;
use ieee.std_logic_1164.all;

ENTITY PortaAnd3Entradas IS

PORT(in1,in2,in3 : IN BIT;
saida_and : OUT BIT);
END PortaAnd3Entradas;

ARCHITECTURE behav OF PortaAnd3Entradas IS
BEGIN
saida_and <= in1 and in2 and in3;
END ARCHITECTURE behav;
