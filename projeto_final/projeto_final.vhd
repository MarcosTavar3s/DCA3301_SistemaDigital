LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY projeto_final IS
    PORT(
        clock_cnt, clock_reg: IN BIT;
        start, pause, reset: IN BIT;
        saida_cnt: OUT std_logic_vector(11 downto 0);
        saida_cnt_m, saida_cnt_c, saida_cnt_d, saida_cnt_u: OUT std_logic_vector(3 downto 0);
        l: OUT BIT;
        cont: OUT INTEGER
    );
END;

ARCHITECTURE behav OF projeto_final IS

    -- Componentes
    COMPONENT comparador_magnitude IS
        PORT(A,B: IN INTEGER;
        A_lt_B:OUT BIT);
    END COMPONENT;

    COMPONENT registrador IS
        PORT(c, clr_registrador, ld_registrador:IN BIT;
        i: IN std_logic_vector(11 DOWNTO 0);
        q: OUT std_logic_vector(11 DOWNTO 0));
    END COMPONENT;

    COMPONENT registrador4bits IS
        PORT(c4bits, clr_registrador4bits, ld_registrador4bits:IN BIT;
        i4bits : IN std_logic_vector(3 DOWNTO 0);
        q4bits : OUT std_logic_vector(3 DOWNTO 0));
    END COMPONENT;

    COMPONENT contador IS
        PORT(clk_cnt, cnt, clr_cnt: IN BIT;
        num: OUT INTEGER);
    END COMPONENT;

    COMPONENT conversor IS
        PORT(segundos: IN std_logic_vector(11 DOWNTO 0);
        s_m, s_c, s_d, s_u:OUT std_logic_vector(3 DOWNTO 0));
    END COMPONENT;

    -- FSM
    TYPE state_type IS (Inicio, Espera, Conta, Pausa);
    SIGNAL state, next_state : state_type;

    -- Sinais auxiliares
    SIGNAL tempo: INTEGER := 0;
    SIGNAL bits_segundos, bits_segundos_reg: std_logic_vector(11 DOWNTO 0);
    SIGNAL bits_segundos_m, bits_segundos_c, bits_segundos_d, bits_segundos_u: std_logic_vector(3 DOWNTO 0);
    SIGNAL menor_3600: BIT;

    -- Controle interno
    SIGNAL en_cnt, clear_cnt, clear_reg, ld_reg: BIT;

BEGIN

    -- FSM - transição de estado
    PROCESS(clock_cnt)
    BEGIN
        IF (clock_cnt'event AND clock_cnt='1') THEN
            state <= next_state;
        END IF;
    END PROCESS;

    -- FSM - lógica de transição
    PROCESS(state, start, pause, reset, menor_3600)
    BEGIN
        CASE state IS
            WHEN Inicio =>
                IF reset = '0' AND pause = '0' THEN
                    next_state <= Espera;
                ELSE
                    next_state <= Inicio;
                END IF;

            WHEN Espera =>
                IF start = '1' AND menor_3600 = '1' THEN
                    next_state <= Conta;
                ELSE
                    next_state <= Espera;
                END IF;

            WHEN Conta =>
                IF pause = '1' AND reset = '0' THEN
                    next_state <= Pausa;
                ELSIF reset = '1' AND pause = '0' THEN
                    next_state <= Inicio;
                ELSIF menor_3600 = '0' THEN
                    next_state <= Inicio;
                ELSE
                    next_state <= Espera;
                END IF;

            WHEN Pausa =>
                IF reset = '1' AND pause = '1' THEN
                    next_state <= Inicio;
                ELSIF (pause = '0' AND reset = '1') OR menor_3600 = '0' THEN
                    next_state <= Conta;
                ELSE
                    next_state <= Pausa;
                END IF;

            WHEN OTHERS =>
                next_state <= Inicio;
        END CASE;
    END PROCESS;

    -- Sinais de controle
    PROCESS(state)
    BEGIN
        -- Default
        en_cnt     <= '0';
        clear_cnt  <= '0';
        clear_reg  <= '0';
        ld_reg     <= '0';

        CASE state IS
            WHEN Inicio =>
                en_cnt     <= '0';
                clear_cnt  <= '1';
                clear_reg  <= '1';

            WHEN Espera =>
                en_cnt     <= '0';
                clear_cnt  <= '0';
                clear_reg  <= '0';

            WHEN Conta =>
                en_cnt     <= '1';
                clear_cnt  <= '0';
                clear_reg  <= '0';
                ld_reg     <= menor_3600;  -- só carrega se menor que 3600

            WHEN Pausa =>
                en_cnt     <= '0';
                clear_cnt  <= '0';
                clear_reg  <= '0';

        END CASE;
    END PROCESS;

    -- contador
    u1: contador PORT MAP(clk_cnt => clock_cnt, cnt => en_cnt, clr_cnt => clear_cnt, num => tempo);
    cont <= tempo;

    -- comparador
    u2: comparador_magnitude PORT MAP(A => tempo, B => 3600, A_lt_B => menor_3600);
    l <= menor_3600;

    -- conversão para bits
    bits_segundos <= std_logic_vector(to_unsigned(tempo, 12));

    -- registrador principal
    u4: registrador PORT MAP(c => clock_reg, ld_registrador => ld_reg, clr_registrador => clear_reg, i => bits_segundos, q => bits_segundos_reg);
    saida_cnt <= bits_segundos_reg;

    -- separação milhar-centena-dezena-unidade
    u5: conversor PORT MAP(segundos => bits_segundos_reg, s_m => bits_segundos_m, s_c => bits_segundos_c, s_d => bits_segundos_d, s_u => bits_segundos_u);

    -- registradores 4 bits
    u6: registrador4bits PORT MAP(c4bits => clock_reg, ld_registrador4bits => ld_reg, clr_registrador4bits => clear_reg, i4bits => bits_segundos_m, q4bits => saida_cnt_m);
    u7: registrador4bits PORT MAP(c4bits => clock_reg, ld_registrador4bits => ld_reg, clr_registrador4bits => clear_reg, i4bits => bits_segundos_c, q4bits => saida_cnt_c);
    u8: registrador4bits PORT MAP(c4bits => clock_reg, ld_registrador4bits => ld_reg, clr_registrador4bits => clear_reg, i4bits => bits_segundos_d, q4bits => saida_cnt_d);
    u9: registrador4bits PORT MAP(c4bits => clock_reg, ld_registrador4bits => ld_reg, clr_registrador4bits => clear_reg, i4bits => bits_segundos_u, q4bits => saida_cnt_u);

END behav;
