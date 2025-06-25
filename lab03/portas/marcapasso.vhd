library ieee;
use ieee.std_logic_1164.all;

entity marcapasso is
	port(s, z, clk: in bit;
			p, t, est0, est1: out bit);
end marcapasso;

architecture behavior of marcapasso is
	signal n1, n0: bit; -- proximo estado
	signal s1, s0: bit; -- estado atual
	
	component reg is
		port(c, i1, i0 : in bit;
		q1, q0 : out bit);
	end component;
	
	component comb_circ is
		port(sc, zc, current1, current0 : in bit;
		next1, next0, pc, tc : out bit);
	end component;
begin 
	u1: reg port map(c=>clk, i1=>n1, i0=>n0, q1=>s1, q0=>s0);
	u2: comb_circ port map(
	sc=> s,	zc => z,	current1 => s1,	current0 => s0,
	next1 => n1, next0 => n0,	pc => p,	tc => t
	);
	
	-- mostra estado atual
	est0 <= s0;
	est1 <= s1;

end behavior;
