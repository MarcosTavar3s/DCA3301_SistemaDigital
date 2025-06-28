LIBRARY ieee;
USE ieee.std_logic_1164.all;
use ieee.numeric_std.all;

ENTITY conversor IS
	PORT(segundos: IN std_logic_vector(11 downto 0);
	s_m, s_c, s_d, s_u:OUT std_logic_vector(3 downto 0));
END;

ARCHITECTURE behav OF conversor IS
	SIGNAL aux_segundos: INTEGER;
	
BEGIN
	aux_segundos <= to_integer(unsigned(segundos));
	s_m <= std_logic_vector(to_unsigned(aux_segundos / 1000, 4));
	s_c <= std_logic_vector(to_unsigned((aux_segundos mod 1000) / 100, 4));
	s_d <= std_logic_vector(to_unsigned(((aux_segundos mod 100) / 10), 4));
	s_u <= std_logic_vector(to_unsigned(aux_segundos mod 10, 4));
END ARCHITECTURE behav;
