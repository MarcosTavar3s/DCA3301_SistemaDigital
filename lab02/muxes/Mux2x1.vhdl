library ieee;
use ieee.std_logic_1164.all;

--comportamental
ENTITY Mux2x1 IS
PORT(i0, i1, s0: IN BIT;
output_comport: OUT BIT);
END Mux2x1;

ARCHITECTURE behav OF Mux2x1 IS
BEGIN
 WITH s0 SELECT
  output_comport <= i0 WHEN '0',
				i1 WHEN '1'; 
END;
