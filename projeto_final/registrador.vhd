LIBRARY ieee;
USE ieee.std_logic_1164.all;
use ieee.numeric_std.all;

ENTITY registrador IS
	 PORT(c, i11, i10, i9, i8, i7, i6, i5, i4, i3, i2, i1, i0:IN BIT;
	 q11, q10, q9, q8, q7, q6, q5, q4, q3, q2, q1, q0:OUT BIT);
END;

ARCHITECTURE behav OF registrador IS
	
BEGIN
	PROCESS(c)
		BEGIN
			IF(c'event AND c='1')THEN
				q11<=i11;
				q10<=i10;
				q9<=i9;
				q8<=i8;
				q7<=i7;
				q6<=i6;
				q5<=i5;
				q4<=i4;
				q3<=i3;
				q2<=i2;
				q1<=i1;
				q0<=i0;
			END IF;
	END PROCESS;
	
END ARCHITECTURE behav;
