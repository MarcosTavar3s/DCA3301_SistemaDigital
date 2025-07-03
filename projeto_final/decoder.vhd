library ieee;
use ieee.std_logic_1164.all;

entity decoder is
  port (
    a : in std_logic_vector(3 downto 0);
    S0, S1, S2, S3, S4, S5, S6 : out std_logic
  );
end decoder;

architecture BEHAV of decoder is
  signal a4, a3, a2, a1 : std_logic;
  signal a4n, a3n, a2n, a1n : std_logic;
begin
  a4 <= a(3);
  a3 <= a(2);
  a2 <= a(1);
  a1 <= a(0);

  -- Inversões
  a4n <= not a4;
  a3n <= not a3;
  a2n <= not a2;
  a1n <= not a1;

  -- Segmento A (S0)
  S0 <= (a4n and a3n and a2n and a1) or  -- 1
        (a4n and a3 and a2n and a1n);    -- 4

  -- Segmento B (S1)
  S1 <= (a4n and a3 and a2n and a1) or   -- 4
        (a4n and a3 and a2 and a1n);     -- 5

  -- Segmento C (S2)
  S2 <= a4n and a3n and a2 and a1n;      -- 2

  -- Segmento D (S3)
  S3 <= (a4n and a3n and a2n and a1) or
        (a4n and a3 and a2n and a1n) or
        (a4n and a3 and a2 and a1);      -- 0, 4, 9

  -- Segmento E (S4)
  S4 <= (a4n and a1) or
        (a4n and a3 and a2n and a1) or
        (a4 and a3n and a2n and a1) or
        (a4n and a3 and a2n and a1n);

  -- Segmento F (S5)
  S5 <= (a4n and a3n and a2n and a1) or
        (a4n and a3n and a2) or
        (a4n and a3 and a2 and a1);

  -- Segmento G (S6)
  S6 <= (a4n and a3n and a2n and a1n) or
        (a4n and a3n and a2n and a1) or
        (a4n and a3 and a2 and a1) or
        (a4 and a2) or
        (a4 and a3);

end architecture;
