library ieee;
use ieee.std_logic_1164.all;

ENTITY PortaXor2Entradas IS

PORT(i1,i2: IN BIT;
saida_xor : OUT BIT);
END PortaXor2Entradas;

ARCHITECTURE behav OF PortaXor2Entradas IS
BEGIN
saida_xor <= i1 xor i2;
END ARCHITECTURE behav;
