LIBRARY ieee;
USE ieee.std_logic_1164.all;
use ieee.numeric_std.all;

ENTITY comparador_magnitude IS
	PORT(A,B: IN INTEGER;
	A_et_B, A_lt_B, A_gt_B:OUT BIT);
END;

ARCHITECTURE behav OF comparador_magnitude IS
	signal bits_A: std_logic_vector(11 downto 0);
	signal bits_B: std_logic_vector(11 downto 0);
	signal eq, gt, lt : std_logic_vector(11 downto 0);
	signal eq_bit, gt_bit: bit;

BEGIN
	bits_A <= std_logic_vector(to_unsigned(A, 12));
	bits_B <= std_logic_vector(to_unsigned(B, 12));
	
	-- compara bit com bit
	gen_bits: for i in 0 to 11 generate
        eq(i) <= not (bits_A(i) xor bits_B(i));  -- A(i) = B(i)
		  gt(i) <= bits_A(i) and (not bits_B(i));  -- A(i) > B(i)
        lt(i) <= (not bits_A(i)) and bits_B(i);  -- A(i) < B(i)
	end generate;
	
	-- A==B
	eq_bit <= to_bit(eq(0) and eq(1) and eq(2) and eq(3) and eq(4) and eq(5) and eq(6) and eq(7) and eq(8) and eq(9) and eq(10) and eq(11));
	A_et_B <= eq_bit;
	
   -- A > B
   gt_bit <= to_bit((gt(11)) or
    (gt(10) and eq(11)) or 
	 (gt(9)  and eq(10) and eq(11)) or
    (gt(8)  and eq(9)  and eq(10) and eq(11)) or
    (gt(7)  and eq(8)  and eq(9)  and eq(10) and eq(11)) or
    (gt(6)  and eq(7)  and eq(8)  and eq(9)  and eq(10) and eq(11)) or
    (gt(5)  and eq(6)  and eq(7)  and eq(8)  and eq(9)  and eq(10) and eq(11)) or
    (gt(4)  and eq(5)  and eq(6)  and eq(7)  and eq(8)  and eq(9)  and eq(10) and eq(11)) or
    (gt(3)  and eq(4)  and eq(5)  and eq(6)  and eq(7)  and eq(8)  and eq(9)  and eq(10) and eq(11)) or
    (gt(2)  and eq(3)  and eq(4)  and eq(5)  and eq(6)  and eq(7)  and eq(8)  and eq(9)  and eq(10) and eq(11)) or
    (gt(1)  and eq(2)  and eq(3)  and eq(4)  and eq(5)  and eq(6)  and eq(7)  and eq(8)  and eq(9)  and eq(10) and eq(11)) or
    (gt(0)  and eq(1)  and eq(2)  and eq(3)  and eq(4)  and eq(5)  and eq(6)  and eq(7)  and eq(8)  and eq(9)  and eq(10) and eq(11)));
	A_gt_B <= gt_bit;
	
   -- A < B
   A_lt_B <= gt_bit nor eq_bit;
			
	
END ARCHITECTURE behav;
