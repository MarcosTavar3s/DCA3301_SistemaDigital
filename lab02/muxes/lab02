library ieee;
use ieee.std_logic_1164.all;

ENTITY lab02 IS
-- en para entradas, slc para seletores do mux
	PORT(en0, en1, en2, en3, slc0, slc1: IN BIT;
	O1 :OUT BIT);
END lab02;

ARCHITECTURE BEHAV OF lab02 IS	
-- sinais auxiliares
SIGNAL saida_mux_0: BIT;
SIGNAL saida_mux_1: BIT;

-- portas logicas
COMPONENT Mux2x1Portas IS
	PORT(e0, e1, sel0: IN BIT;
	output_port: OUT BIT);
END COMPONENT;

-- comportamental
COMPONENT Mux2x1 IS
	PORT(i0, i1, s0: IN BIT;
	output_comport: OUT BIT);
END COMPONENT;
	
BEGIN
	-- mux 2x1 comportamental
	--	u1: Mux2x1 PORT MAP(i0=>en0, i1=>en1, s0=>slc0, output_comport=>O1);

	-- mux 2x1 portas logicas
	-- u1: Mux2x1Portas PORT MAP(e0=>en0, e1=>en1, sel0=>slc0, output_port=>O1);

	-- muxes intermediarios para fazer o 4x1 (comportamental)
	-- u1: Mux2x1 PORT MAP(i0=>en0, i1=>en1, s0=>slc0, output_comport=>saida_mux_0);
	-- u2: Mux2x1 PORT MAP(i0=>en2, i1=>en3, s0=>slc0, output_comport=>saida_mux_1);
	-- uso do mux2x1 para o 4x1
	-- u3: Mux2x1 PORT MAP(i0=>saida_mux_0, i1=>saida_mux_1, s0=>slc1, output_comport=>O1);
	
	-- muxes intermediarios para fazer o 4x1 (portas logicas)
	u1: Mux2x1Portas PORT MAP(e0=>en0, e1=>en1, sel0=>slc0, output_port=>saida_mux_0);
	u2: Mux2x1Portas PORT MAP(e0=>en2, e1=>en3, sel0=>slc0, output_port=>saida_mux_1);
	-- uso do mux2x1 para o 4x1
	u3: Mux2x1Portas PORT MAP(e0=>saida_mux_0, e1=>saida_mux_1, sel0=>slc1, output_port=>O1);
	
	
END ARCHITECTURE BEHAV;
