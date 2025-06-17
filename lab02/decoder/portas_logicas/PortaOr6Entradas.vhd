library ieee;
use ieee.std_logic_1164.all;

ENTITY PortaOr6Entradas IS

PORT(e1, e2, e3, e4, e5, e6 : IN BIT;
saida_or : OUT BIT);
END PortaOr6Entradas;

ARCHITECTURE behav OF PortaOr6Entradas IS
BEGIN
saida_or <= e1 or e2 or e3 or e4 or e5 or e6;
END ARCHITECTURE behav;
