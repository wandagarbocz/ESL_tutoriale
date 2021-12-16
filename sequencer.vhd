-- File: sequencer.vhd
-- Generated by MyHDL 0.11
-- Date: Thu Dec 16 19:48:11 2021


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use std.textio.all;

use work.pck_myhdl_011.all;

entity sequencer is
    port (
        gain: out std_logic;
        shutdown: out std_logic;
        reset: in std_logic;
        clk: in std_logic;
        ceo: out std_logic;
        start: in std_logic
    );
end entity sequencer;


architecture MyHDL of sequencer is


type t_enum_t_state_1 is (
	A_5,
	Fis_5,
	G_5,
	A_4,
	B_4,
	Cis_5,
	D_5,
	E_5
	);

signal ceo_sig: std_logic;
signal iteration: unsigned(1 downto 0);
signal state: t_enum_t_state_1;
type t_array_length_divider is array(0 to 9-1) of unsigned(4 downto 0);
signal length_divider: t_array_length_divider;
type t_array_sounds_divider is array(0 to 8-1) of unsigned(6 downto 0);
signal sounds_divider: t_array_sounds_divider;

begin




SEQUENCER_SEQ_LOGIC: process (clk, reset) is
begin
    if (reset = '1') then
        length_divider(0) <= to_unsigned(1, 5);
        length_divider(1) <= to_unsigned(1, 5);
        length_divider(2) <= to_unsigned(1, 5);
        length_divider(3) <= to_unsigned(1, 5);
        length_divider(4) <= to_unsigned(1, 5);
        length_divider(5) <= to_unsigned(1, 5);
        length_divider(6) <= to_unsigned(1, 5);
        length_divider(7) <= to_unsigned(1, 5);
        length_divider(8) <= to_unsigned(1, 5);
        ceo <= '0';
        sounds_divider(0) <= to_unsigned(1, 7);
        sounds_divider(1) <= to_unsigned(1, 7);
        sounds_divider(2) <= to_unsigned(1, 7);
        sounds_divider(3) <= to_unsigned(1, 7);
        sounds_divider(4) <= to_unsigned(1, 7);
        sounds_divider(5) <= to_unsigned(1, 7);
        sounds_divider(6) <= to_unsigned(1, 7);
        sounds_divider(7) <= to_unsigned(1, 7);
        state <= A_5;
        shutdown <= '0';
        ceo_sig <= '0';
        iteration <= to_unsigned(0, 2);
        gain <= '0';
    elsif rising_edge(clk) then
        gain <= '1';
        shutdown <= '1';
        if (reset = '1') then
            state <= A_5;
            for i in 0 to 8-1 loop
                sounds_divider(i) <= to_unsigned(1, 7);
            end loop;
            ceo_sig <= '0';
            iteration <= to_unsigned(0, 2);
            for i in 0 to 9-1 loop
                length_divider(i) <= to_unsigned(1, 5);
            end loop;
        else
            if (start = '1') then
                case state is
                    when A_5 =>
                        if (sounds_divider(0) = 0) then
                            if (ceo_sig = '1') then
                                if (iteration < 2) then
                                    if (length_divider(0) = 0) then
                                        state <= Fis_5;
                                        iteration <= (iteration + 1);
                                    end if;
                                    length_divider(0) <= (length_divider(0) + 1);
                                else
                                    if (length_divider(8) = 0) then
                                        state <= A_4;
                                        iteration <= to_unsigned(0, 2);
                                    end if;
                                    length_divider(8) <= (length_divider(8) + 1);
                                end if;
                            end if;
                            ceo_sig <= stdl((not bool(ceo_sig)));
                        end if;
                        sounds_divider(0) <= (sounds_divider(0) + 1);
                    when Fis_5 =>
                        if (sounds_divider(1) = 0) then
                            if (ceo_sig = '1') then
                                if (length_divider(1) = 0) then
                                    state <= G_5;
                                end if;
                                length_divider(1) <= (length_divider(1) + 1);
                            end if;
                            ceo_sig <= stdl((not bool(ceo_sig)));
                        end if;
                        sounds_divider(1) <= (sounds_divider(1) + 1);
                    when G_5 =>
                        if (sounds_divider(2) = 0) then
                            if (ceo_sig = '1') then
                                if (length_divider(2) = 0) then
                                    state <= A_5;
                                end if;
                                length_divider(2) <= (length_divider(2) + 1);
                            end if;
                            ceo_sig <= stdl((not bool(ceo_sig)));
                        end if;
                        sounds_divider(2) <= (sounds_divider(2) + 1);
                    when A_4 =>
                        if (sounds_divider(3) = 0) then
                            if (ceo_sig = '1') then
                                if (length_divider(3) = 0) then
                                    state <= B_4;
                                end if;
                                length_divider(3) <= (length_divider(3) + 1);
                            end if;
                            ceo_sig <= stdl((not bool(ceo_sig)));
                        end if;
                        sounds_divider(3) <= (sounds_divider(3) + 1);
                    when B_4 =>
                        if (sounds_divider(4) = 0) then
                            if (ceo_sig = '1') then
                                if (length_divider(4) = 0) then
                                    state <= Cis_5;
                                end if;
                                length_divider(4) <= (length_divider(4) + 1);
                            end if;
                            ceo_sig <= stdl((not bool(ceo_sig)));
                        end if;
                        sounds_divider(4) <= (sounds_divider(4) + 1);
                    when Cis_5 =>
                        if (sounds_divider(5) = 0) then
                            if (ceo_sig = '1') then
                                if (length_divider(5) = 0) then
                                    state <= D_5;
                                end if;
                                length_divider(5) <= (length_divider(5) + 1);
                            end if;
                            ceo_sig <= stdl((not bool(ceo_sig)));
                        end if;
                        sounds_divider(5) <= (sounds_divider(5) + 1);
                    when D_5 =>
                        if (sounds_divider(6) = 0) then
                            if (ceo_sig = '1') then
                                if (length_divider(6) = 0) then
                                    state <= E_5;
                                end if;
                                length_divider(6) <= (length_divider(6) + 1);
                            end if;
                            ceo_sig <= stdl((not bool(ceo_sig)));
                        end if;
                        sounds_divider(6) <= (sounds_divider(6) + 1);
                    when others => -- E_5
                        if (sounds_divider(7) = 0) then
                            if (ceo_sig = '1') then
                                if (length_divider(7) = 0) then
                                    state <= Fis_5;
                                end if;
                                length_divider(7) <= (length_divider(7) + 1);
                            end if;
                            ceo_sig <= stdl((not bool(ceo_sig)));
                        end if;
                        sounds_divider(7) <= (sounds_divider(7) + 1);
                end case;
            end if;
        end if;
        ceo <= ceo_sig;
    end if;
end process SEQUENCER_SEQ_LOGIC;

end architecture MyHDL;
