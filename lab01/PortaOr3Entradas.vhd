library ieee;
use ieee.std_logic_1164.all;

ENTITY PortaOr3Entradas IS

PORT(e1,e2,e3 : IN BIT;
saida_or : OUT BIT);
END PortaOr3Entradas;

ARCHITECTURE behav OF PortaOr3Entradas IS
BEGIN
saida_or <= e1 or e2 or e3;
END ARCHITECTURE behav;
