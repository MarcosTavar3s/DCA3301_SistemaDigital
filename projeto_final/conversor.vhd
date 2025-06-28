LIBRARY ieee;
USE ieee.std_logic_1164.all;
use ieee.numeric_std.all;

ENTITY conversor IS
	PORT(segundos: IN INTEGER;
	s_m, s_c, s_d, s_u:OUT INTEGER);
END;

ARCHITECTURE behav OF conversor IS
BEGIN
	s_m <= segundos mod 1000;
	s_c <= (segundos mod 1000)/100;
	s_d <= ((segundos mod 1000) mod 100)/10;
	s_u <= ((segundos mod 1000) mod 100) mod 10;
END ARCHITECTURE behav;
