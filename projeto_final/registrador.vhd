LIBRARY ieee;
USE ieee.std_logic_1164.all;
use ieee.numeric_std.all;

ENTITY registrador IS
	 PORT(c, clr_registrador, ld_registrador:IN BIT;
	 i : IN std_logic_vector(11 DOWNTO 0);
	 q : OUT std_logic_vector(11 DOWNTO 0));
END;

ARCHITECTURE behav OF registrador IS
SIGNAL reg : std_logic_vector(11 DOWNTO 0);

BEGIN
	PROCESS(c)
		BEGIN
			IF(c'event and c='1')THEN
				IF clr_registrador = '1' THEN
					reg <= (OTHERS => '0');
				ELSIF ld_registrador = '1' THEN
				reg <= i;
				END IF;
			END IF;
	END PROCESS;
	q <= reg;
END ARCHITECTURE behav;
