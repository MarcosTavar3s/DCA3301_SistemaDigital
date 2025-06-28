LIBRARY ieee;
USE ieee.std_logic_1164.all ;
 
ENTITY contador IS
	PORT(clk_cnt, cnt, clr_cnt: IN BIT;
	num: OUT INTEGER);
END;

ARCHITECTURE behav OF contador IS
	  SIGNAL reg_num : INTEGER range 0 to 4095 := 0;
	  
BEGIN
	PROCESS(clk_cnt)
		BEGIN
			IF(clk_cnt'event and clk_cnt='1')THEN
				IF clr_cnt = '1' THEN
					reg_num <= 0;
				ELSIF cnt = '1' THEN
					reg_num <= reg_num + 1;
				END IF;
			END IF;
	END PROCESS;
	
	num <= reg_num;

END ARCHITECTURE behav; 
