library ieee;
use ieee.std_logic_1164.all;

entity comb_circ is
	port(sc, zc, current1, current0 : in bit;
	next1, next0, pc, tc : out bit);
end comb_circ;

architecture behav of comb_circ is

begin
	next1 <= ((not(current1)) and current0 and (not(sc)) and zc);
	next0 <= ((not(current0)) and (not(current1))) or ((not(sc)) and (not(zc)) and (not(current1)) and current0);
	pc <= (not(current0)) and current1;
	tc <= (not(current0)) and (not(current1));
end architecture behav;
