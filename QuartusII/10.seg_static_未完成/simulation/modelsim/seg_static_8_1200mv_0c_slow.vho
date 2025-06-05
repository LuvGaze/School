-- Copyright (C) 1991-2013 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus II 64-Bit"
-- VERSION "Version 13.0.1 Build 232 06/12/2013 Service Pack 1 SJ Full Version"

-- DATE "06/04/2025 17:03:22"

-- 
-- Device: Altera EP4CE6E22C8 Package TQFP144
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY ALTERA;
LIBRARY CYCLONEIVE;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE CYCLONEIVE.CYCLONEIVE_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	seg_595_static IS
    PORT (
	sys_clk : IN std_logic;
	sys_rst_n : IN std_logic;
	stcp : OUT std_logic;
	shcp : OUT std_logic;
	ds : OUT std_logic;
	oe : OUT std_logic
	);
END seg_595_static;

-- Design Ports Information
-- stcp	=>  Location: PIN_46,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- shcp	=>  Location: PIN_43,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ds	=>  Location: PIN_50,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- oe	=>  Location: PIN_87,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- sys_rst_n	=>  Location: PIN_89,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- sys_clk	=>  Location: PIN_23,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF seg_595_static IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_sys_clk : std_logic;
SIGNAL ww_sys_rst_n : std_logic;
SIGNAL ww_stcp : std_logic;
SIGNAL ww_shcp : std_logic;
SIGNAL ww_ds : std_logic;
SIGNAL ww_oe : std_logic;
SIGNAL \sys_clk~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \sys_rst_n~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \seg_static|Add1~13\ : std_logic;
SIGNAL \seg_static|Add1~14_combout\ : std_logic;
SIGNAL \seg_static|Add0~8_combout\ : std_logic;
SIGNAL \seg_static|Add0~10_combout\ : std_logic;
SIGNAL \seg_static|Add0~26_combout\ : std_logic;
SIGNAL \seg_static|Add0~36_combout\ : std_logic;
SIGNAL \seg_static|Add0~38_combout\ : std_logic;
SIGNAL \seg_static|Add0~40_combout\ : std_logic;
SIGNAL \seg_static|Add0~59\ : std_logic;
SIGNAL \seg_static|Add0~60_combout\ : std_logic;
SIGNAL \hc595_ctrl|Mux0~2_combout\ : std_logic;
SIGNAL \seg_static|WideOr5~0_combout\ : std_logic;
SIGNAL \seg_static|WideOr5~1_combout\ : std_logic;
SIGNAL \seg_static|WideOr4~0_combout\ : std_logic;
SIGNAL \seg_static|WideOr4~1_combout\ : std_logic;
SIGNAL \seg_static|WideOr1~0_combout\ : std_logic;
SIGNAL \seg_static|WideOr1~1_combout\ : std_logic;
SIGNAL \seg_static|Equal0~3_combout\ : std_logic;
SIGNAL \seg_static|Equal0~6_combout\ : std_logic;
SIGNAL \seg_static|cnt_wait~2_combout\ : std_logic;
SIGNAL \seg_static|cnt_wait~3_combout\ : std_logic;
SIGNAL \seg_static|cnt_wait~4_combout\ : std_logic;
SIGNAL \seg_static|cnt_wait~7_combout\ : std_logic;
SIGNAL \seg_static|cnt_wait~11_combout\ : std_logic;
SIGNAL \stcp~output_o\ : std_logic;
SIGNAL \shcp~output_o\ : std_logic;
SIGNAL \ds~output_o\ : std_logic;
SIGNAL \oe~output_o\ : std_logic;
SIGNAL \sys_clk~input_o\ : std_logic;
SIGNAL \sys_clk~inputclkctrl_outclk\ : std_logic;
SIGNAL \hc595_ctrl|cnt_4[0]~0_combout\ : std_logic;
SIGNAL \sys_rst_n~input_o\ : std_logic;
SIGNAL \sys_rst_n~inputclkctrl_outclk\ : std_logic;
SIGNAL \hc595_ctrl|cnt_bit[0]~6_combout\ : std_logic;
SIGNAL \hc595_ctrl|cnt_bit[1]~5_combout\ : std_logic;
SIGNAL \hc595_ctrl|always2~0_combout\ : std_logic;
SIGNAL \hc595_ctrl|cnt_bit[2]~7_combout\ : std_logic;
SIGNAL \hc595_ctrl|cnt_bit[3]~4_combout\ : std_logic;
SIGNAL \hc595_ctrl|always2~1_combout\ : std_logic;
SIGNAL \hc595_ctrl|stcp~q\ : std_logic;
SIGNAL \seg_static|Add0~0_combout\ : std_logic;
SIGNAL \hc595_ctrl|shcp~feeder_combout\ : std_logic;
SIGNAL \hc595_ctrl|shcp~q\ : std_logic;
SIGNAL \seg_static|Add1~1\ : std_logic;
SIGNAL \seg_static|Add1~2_combout\ : std_logic;
SIGNAL \seg_static|Add0~1\ : std_logic;
SIGNAL \seg_static|Add0~2_combout\ : std_logic;
SIGNAL \seg_static|Add0~3\ : std_logic;
SIGNAL \seg_static|Add0~5\ : std_logic;
SIGNAL \seg_static|Add0~6_combout\ : std_logic;
SIGNAL \seg_static|Add0~7\ : std_logic;
SIGNAL \seg_static|Add0~9\ : std_logic;
SIGNAL \seg_static|Add0~11\ : std_logic;
SIGNAL \seg_static|Add0~12_combout\ : std_logic;
SIGNAL \seg_static|Add0~13\ : std_logic;
SIGNAL \seg_static|Add0~14_combout\ : std_logic;
SIGNAL \seg_static|Add0~15\ : std_logic;
SIGNAL \seg_static|Add0~16_combout\ : std_logic;
SIGNAL \seg_static|Add0~17\ : std_logic;
SIGNAL \seg_static|Add0~18_combout\ : std_logic;
SIGNAL \seg_static|Add0~19\ : std_logic;
SIGNAL \seg_static|Add0~20_combout\ : std_logic;
SIGNAL \seg_static|cnt_wait~10_combout\ : std_logic;
SIGNAL \seg_static|Add0~21\ : std_logic;
SIGNAL \seg_static|Add0~23\ : std_logic;
SIGNAL \seg_static|Add0~24_combout\ : std_logic;
SIGNAL \seg_static|cnt_wait~8_combout\ : std_logic;
SIGNAL \seg_static|Add0~25\ : std_logic;
SIGNAL \seg_static|Add0~27\ : std_logic;
SIGNAL \seg_static|Add0~29\ : std_logic;
SIGNAL \seg_static|Add0~30_combout\ : std_logic;
SIGNAL \seg_static|cnt_wait~6_combout\ : std_logic;
SIGNAL \seg_static|Add0~31\ : std_logic;
SIGNAL \seg_static|Add0~32_combout\ : std_logic;
SIGNAL \seg_static|Add0~33\ : std_logic;
SIGNAL \seg_static|Add0~34_combout\ : std_logic;
SIGNAL \seg_static|cnt_wait~5_combout\ : std_logic;
SIGNAL \seg_static|Add0~35\ : std_logic;
SIGNAL \seg_static|Add0~37\ : std_logic;
SIGNAL \seg_static|Add0~39\ : std_logic;
SIGNAL \seg_static|Add0~41\ : std_logic;
SIGNAL \seg_static|Add0~42_combout\ : std_logic;
SIGNAL \seg_static|cnt_wait~1_combout\ : std_logic;
SIGNAL \seg_static|Add0~43\ : std_logic;
SIGNAL \seg_static|Add0~44_combout\ : std_logic;
SIGNAL \seg_static|Add0~45\ : std_logic;
SIGNAL \seg_static|Add0~46_combout\ : std_logic;
SIGNAL \seg_static|cnt_wait~0_combout\ : std_logic;
SIGNAL \seg_static|Add0~47\ : std_logic;
SIGNAL \seg_static|Add0~48_combout\ : std_logic;
SIGNAL \seg_static|Equal0~2_combout\ : std_logic;
SIGNAL \seg_static|Add0~22_combout\ : std_logic;
SIGNAL \seg_static|cnt_wait~9_combout\ : std_logic;
SIGNAL \seg_static|Equal0~5_combout\ : std_logic;
SIGNAL \seg_static|Add0~4_combout\ : std_logic;
SIGNAL \seg_static|Equal0~7_combout\ : std_logic;
SIGNAL \seg_static|Add0~28_combout\ : std_logic;
SIGNAL \seg_static|Equal0~4_combout\ : std_logic;
SIGNAL \seg_static|Equal0~8_combout\ : std_logic;
SIGNAL \seg_static|Add0~49\ : std_logic;
SIGNAL \seg_static|Add0~50_combout\ : std_logic;
SIGNAL \seg_static|Add0~51\ : std_logic;
SIGNAL \seg_static|Add0~53\ : std_logic;
SIGNAL \seg_static|Add0~54_combout\ : std_logic;
SIGNAL \seg_static|Add0~55\ : std_logic;
SIGNAL \seg_static|Add0~57\ : std_logic;
SIGNAL \seg_static|Add0~58_combout\ : std_logic;
SIGNAL \seg_static|Add0~52_combout\ : std_logic;
SIGNAL \seg_static|Add0~56_combout\ : std_logic;
SIGNAL \seg_static|Equal0~0_combout\ : std_logic;
SIGNAL \hc595_ctrl|Equal1~0_combout\ : std_logic;
SIGNAL \seg_static|Equal0~1_combout\ : std_logic;
SIGNAL \seg_static|Equal0~9_combout\ : std_logic;
SIGNAL \seg_static|add_flag~q\ : std_logic;
SIGNAL \seg_static|Add1~3\ : std_logic;
SIGNAL \seg_static|Add1~4_combout\ : std_logic;
SIGNAL \seg_static|Add1~5\ : std_logic;
SIGNAL \seg_static|Add1~6_combout\ : std_logic;
SIGNAL \seg_static|Equal1~1_combout\ : std_logic;
SIGNAL \seg_static|Add1~7\ : std_logic;
SIGNAL \seg_static|Add1~8_combout\ : std_logic;
SIGNAL \seg_static|num~0_combout\ : std_logic;
SIGNAL \seg_static|Add1~9\ : std_logic;
SIGNAL \seg_static|Add1~11\ : std_logic;
SIGNAL \seg_static|Add1~12_combout\ : std_logic;
SIGNAL \seg_static|Add1~10_combout\ : std_logic;
SIGNAL \seg_static|Equal1~0_combout\ : std_logic;
SIGNAL \seg_static|Add1~0_combout\ : std_logic;
SIGNAL \seg_static|WideOr2~0_combout\ : std_logic;
SIGNAL \seg_static|WideOr2~1_combout\ : std_logic;
SIGNAL \seg_static|WideOr3~0_combout\ : std_logic;
SIGNAL \seg_static|WideOr3~1_combout\ : std_logic;
SIGNAL \hc595_ctrl|Mux0~3_combout\ : std_logic;
SIGNAL \seg_static|WideOr7~0_combout\ : std_logic;
SIGNAL \seg_static|WideOr7~1_combout\ : std_logic;
SIGNAL \seg_static|WideOr6~0_combout\ : std_logic;
SIGNAL \seg_static|WideOr6~1_combout\ : std_logic;
SIGNAL \hc595_ctrl|Mux0~0_combout\ : std_logic;
SIGNAL \hc595_ctrl|Mux0~1_combout\ : std_logic;
SIGNAL \hc595_ctrl|ds~0_combout\ : std_logic;
SIGNAL \hc595_ctrl|ds~1_combout\ : std_logic;
SIGNAL \hc595_ctrl|ds~q\ : std_logic;
SIGNAL \seg_static|seg\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \seg_static|num\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \seg_static|cnt_wait\ : std_logic_vector(31 DOWNTO 0);
SIGNAL \hc595_ctrl|cnt_bit\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \hc595_ctrl|cnt_4\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \ALT_INV_sys_rst_n~input_o\ : std_logic;

BEGIN

ww_sys_clk <= sys_clk;
ww_sys_rst_n <= sys_rst_n;
stcp <= ww_stcp;
shcp <= ww_shcp;
ds <= ww_ds;
oe <= ww_oe;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\sys_clk~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \sys_clk~input_o\);

\sys_rst_n~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \sys_rst_n~input_o\);
\ALT_INV_sys_rst_n~input_o\ <= NOT \sys_rst_n~input_o\;

-- Location: LCCOMB_X9_Y4_N24
\seg_static|Add1~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \seg_static|Add1~12_combout\ = (\seg_static|num\(6) & (\seg_static|Add1~11\ $ (GND))) # (!\seg_static|num\(6) & (!\seg_static|Add1~11\ & VCC))
-- \seg_static|Add1~13\ = CARRY((\seg_static|num\(6) & !\seg_static|Add1~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \seg_static|num\(6),
	datad => VCC,
	cin => \seg_static|Add1~11\,
	combout => \seg_static|Add1~12_combout\,
	cout => \seg_static|Add1~13\);

-- Location: LCCOMB_X9_Y4_N26
\seg_static|Add1~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \seg_static|Add1~14_combout\ = \seg_static|num\(7) $ (\seg_static|Add1~13\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \seg_static|num\(7),
	cin => \seg_static|Add1~13\,
	combout => \seg_static|Add1~14_combout\);

-- Location: LCCOMB_X5_Y5_N10
\seg_static|Add0~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \seg_static|Add0~8_combout\ = (\seg_static|cnt_wait\(5) & (\seg_static|Add0~7\ $ (GND))) # (!\seg_static|cnt_wait\(5) & (!\seg_static|Add0~7\ & VCC))
-- \seg_static|Add0~9\ = CARRY((\seg_static|cnt_wait\(5) & !\seg_static|Add0~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \seg_static|cnt_wait\(5),
	datad => VCC,
	cin => \seg_static|Add0~7\,
	combout => \seg_static|Add0~8_combout\,
	cout => \seg_static|Add0~9\);

-- Location: LCCOMB_X5_Y5_N12
\seg_static|Add0~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \seg_static|Add0~10_combout\ = (\seg_static|cnt_wait\(6) & (!\seg_static|Add0~9\)) # (!\seg_static|cnt_wait\(6) & ((\seg_static|Add0~9\) # (GND)))
-- \seg_static|Add0~11\ = CARRY((!\seg_static|Add0~9\) # (!\seg_static|cnt_wait\(6)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \seg_static|cnt_wait\(6),
	datad => VCC,
	cin => \seg_static|Add0~9\,
	combout => \seg_static|Add0~10_combout\,
	cout => \seg_static|Add0~11\);

-- Location: LCCOMB_X5_Y5_N28
\seg_static|Add0~26\ : cycloneive_lcell_comb
-- Equation(s):
-- \seg_static|Add0~26_combout\ = (\seg_static|cnt_wait\(14) & (!\seg_static|Add0~25\)) # (!\seg_static|cnt_wait\(14) & ((\seg_static|Add0~25\) # (GND)))
-- \seg_static|Add0~27\ = CARRY((!\seg_static|Add0~25\) # (!\seg_static|cnt_wait\(14)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \seg_static|cnt_wait\(14),
	datad => VCC,
	cin => \seg_static|Add0~25\,
	combout => \seg_static|Add0~26_combout\,
	cout => \seg_static|Add0~27\);

-- Location: LCCOMB_X5_Y4_N6
\seg_static|Add0~36\ : cycloneive_lcell_comb
-- Equation(s):
-- \seg_static|Add0~36_combout\ = (\seg_static|cnt_wait\(19) & (\seg_static|Add0~35\ $ (GND))) # (!\seg_static|cnt_wait\(19) & (!\seg_static|Add0~35\ & VCC))
-- \seg_static|Add0~37\ = CARRY((\seg_static|cnt_wait\(19) & !\seg_static|Add0~35\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \seg_static|cnt_wait\(19),
	datad => VCC,
	cin => \seg_static|Add0~35\,
	combout => \seg_static|Add0~36_combout\,
	cout => \seg_static|Add0~37\);

-- Location: LCCOMB_X5_Y4_N8
\seg_static|Add0~38\ : cycloneive_lcell_comb
-- Equation(s):
-- \seg_static|Add0~38_combout\ = (\seg_static|cnt_wait\(20) & (!\seg_static|Add0~37\)) # (!\seg_static|cnt_wait\(20) & ((\seg_static|Add0~37\) # (GND)))
-- \seg_static|Add0~39\ = CARRY((!\seg_static|Add0~37\) # (!\seg_static|cnt_wait\(20)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \seg_static|cnt_wait\(20),
	datad => VCC,
	cin => \seg_static|Add0~37\,
	combout => \seg_static|Add0~38_combout\,
	cout => \seg_static|Add0~39\);

-- Location: LCCOMB_X5_Y4_N10
\seg_static|Add0~40\ : cycloneive_lcell_comb
-- Equation(s):
-- \seg_static|Add0~40_combout\ = (\seg_static|cnt_wait\(21) & (\seg_static|Add0~39\ $ (GND))) # (!\seg_static|cnt_wait\(21) & (!\seg_static|Add0~39\ & VCC))
-- \seg_static|Add0~41\ = CARRY((\seg_static|cnt_wait\(21) & !\seg_static|Add0~39\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \seg_static|cnt_wait\(21),
	datad => VCC,
	cin => \seg_static|Add0~39\,
	combout => \seg_static|Add0~40_combout\,
	cout => \seg_static|Add0~41\);

-- Location: LCCOMB_X5_Y4_N28
\seg_static|Add0~58\ : cycloneive_lcell_comb
-- Equation(s):
-- \seg_static|Add0~58_combout\ = (\seg_static|cnt_wait\(30) & (!\seg_static|Add0~57\)) # (!\seg_static|cnt_wait\(30) & ((\seg_static|Add0~57\) # (GND)))
-- \seg_static|Add0~59\ = CARRY((!\seg_static|Add0~57\) # (!\seg_static|cnt_wait\(30)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \seg_static|cnt_wait\(30),
	datad => VCC,
	cin => \seg_static|Add0~57\,
	combout => \seg_static|Add0~58_combout\,
	cout => \seg_static|Add0~59\);

-- Location: LCCOMB_X5_Y4_N30
\seg_static|Add0~60\ : cycloneive_lcell_comb
-- Equation(s):
-- \seg_static|Add0~60_combout\ = \seg_static|cnt_wait\(31) $ (!\seg_static|Add0~59\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010110100101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \seg_static|cnt_wait\(31),
	cin => \seg_static|Add0~59\,
	combout => \seg_static|Add0~60_combout\);

-- Location: FF_X8_Y4_N21
\seg_static|seg[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~inputclkctrl_outclk\,
	d => \seg_static|WideOr5~1_combout\,
	clrn => \sys_rst_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \seg_static|seg\(2));

-- Location: FF_X7_Y4_N31
\seg_static|seg[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~inputclkctrl_outclk\,
	d => \seg_static|WideOr4~1_combout\,
	clrn => \sys_rst_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \seg_static|seg\(3));

-- Location: FF_X7_Y4_N13
\seg_static|seg[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~inputclkctrl_outclk\,
	d => \seg_static|WideOr1~1_combout\,
	clrn => \sys_rst_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \seg_static|seg\(6));

-- Location: FF_X7_Y4_N11
\seg_static|seg[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~inputclkctrl_outclk\,
	asdata => \seg_static|Equal1~0_combout\,
	clrn => \sys_rst_n~inputclkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \seg_static|seg\(7));

-- Location: LCCOMB_X7_Y4_N10
\hc595_ctrl|Mux0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \hc595_ctrl|Mux0~2_combout\ = (\hc595_ctrl|cnt_bit\(1) & (((\hc595_ctrl|cnt_bit\(0))))) # (!\hc595_ctrl|cnt_bit\(1) & ((\hc595_ctrl|cnt_bit\(0) & (!\seg_static|seg\(6))) # (!\hc595_ctrl|cnt_bit\(0) & ((!\seg_static|seg\(7))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110100000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \seg_static|seg\(6),
	datab => \hc595_ctrl|cnt_bit\(1),
	datac => \seg_static|seg\(7),
	datad => \hc595_ctrl|cnt_bit\(0),
	combout => \hc595_ctrl|Mux0~2_combout\);

-- Location: LCCOMB_X8_Y4_N18
\seg_static|WideOr5~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \seg_static|WideOr5~0_combout\ = (\seg_static|num\(3) & (\seg_static|num\(2) & ((\seg_static|num\(1)) # (!\seg_static|num\(0))))) # (!\seg_static|num\(3) & (\seg_static|num\(1) & (!\seg_static|num\(0) & !\seg_static|num\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000101000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \seg_static|num\(3),
	datab => \seg_static|num\(1),
	datac => \seg_static|num\(0),
	datad => \seg_static|num\(2),
	combout => \seg_static|WideOr5~0_combout\);

-- Location: FF_X9_Y4_N27
\seg_static|num[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~inputclkctrl_outclk\,
	d => \seg_static|Add1~14_combout\,
	clrn => \sys_rst_n~inputclkctrl_outclk\,
	ena => \seg_static|add_flag~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \seg_static|num\(7));

-- Location: LCCOMB_X8_Y4_N20
\seg_static|WideOr5~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \seg_static|WideOr5~1_combout\ = (\seg_static|Equal1~0_combout\ & !\seg_static|WideOr5~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \seg_static|Equal1~0_combout\,
	datad => \seg_static|WideOr5~0_combout\,
	combout => \seg_static|WideOr5~1_combout\);

-- Location: LCCOMB_X8_Y4_N14
\seg_static|WideOr4~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \seg_static|WideOr4~0_combout\ = (\seg_static|num\(1) & ((\seg_static|num\(0) & ((\seg_static|num\(2)))) # (!\seg_static|num\(0) & (\seg_static|num\(3) & !\seg_static|num\(2))))) # (!\seg_static|num\(1) & (!\seg_static|num\(3) & (\seg_static|num\(0) $ 
-- (\seg_static|num\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000100011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \seg_static|num\(3),
	datab => \seg_static|num\(1),
	datac => \seg_static|num\(0),
	datad => \seg_static|num\(2),
	combout => \seg_static|WideOr4~0_combout\);

-- Location: LCCOMB_X7_Y4_N30
\seg_static|WideOr4~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \seg_static|WideOr4~1_combout\ = (\seg_static|Equal1~0_combout\ & !\seg_static|WideOr4~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \seg_static|Equal1~0_combout\,
	datac => \seg_static|WideOr4~0_combout\,
	combout => \seg_static|WideOr4~1_combout\);

-- Location: LCCOMB_X8_Y4_N0
\seg_static|WideOr1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \seg_static|WideOr1~0_combout\ = (\seg_static|num\(0) & ((\seg_static|num\(3)) # (\seg_static|num\(1) $ (\seg_static|num\(2))))) # (!\seg_static|num\(0) & ((\seg_static|num\(1)) # (\seg_static|num\(3) $ (\seg_static|num\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011110111101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \seg_static|num\(3),
	datab => \seg_static|num\(1),
	datac => \seg_static|num\(0),
	datad => \seg_static|num\(2),
	combout => \seg_static|WideOr1~0_combout\);

-- Location: LCCOMB_X7_Y4_N12
\seg_static|WideOr1~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \seg_static|WideOr1~1_combout\ = (\seg_static|Equal1~0_combout\ & \seg_static|WideOr1~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \seg_static|Equal1~0_combout\,
	datac => \seg_static|WideOr1~0_combout\,
	combout => \seg_static|WideOr1~1_combout\);

-- Location: FF_X5_Y4_N31
\seg_static|cnt_wait[31]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~inputclkctrl_outclk\,
	d => \seg_static|Add0~60_combout\,
	clrn => \sys_rst_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \seg_static|cnt_wait\(31));

-- Location: FF_X6_Y4_N21
\seg_static|cnt_wait[21]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~inputclkctrl_outclk\,
	d => \seg_static|cnt_wait~2_combout\,
	clrn => \sys_rst_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \seg_static|cnt_wait\(21));

-- Location: FF_X6_Y4_N7
\seg_static|cnt_wait[20]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~inputclkctrl_outclk\,
	d => \seg_static|cnt_wait~3_combout\,
	clrn => \sys_rst_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \seg_static|cnt_wait\(20));

-- Location: FF_X6_Y4_N5
\seg_static|cnt_wait[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~inputclkctrl_outclk\,
	d => \seg_static|cnt_wait~4_combout\,
	clrn => \sys_rst_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \seg_static|cnt_wait\(19));

-- Location: LCCOMB_X6_Y4_N12
\seg_static|Equal0~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \seg_static|Equal0~3_combout\ = (\seg_static|cnt_wait\(18) & (\seg_static|cnt_wait\(21) & (\seg_static|cnt_wait\(19) & \seg_static|cnt_wait\(20))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \seg_static|cnt_wait\(18),
	datab => \seg_static|cnt_wait\(21),
	datac => \seg_static|cnt_wait\(19),
	datad => \seg_static|cnt_wait\(20),
	combout => \seg_static|Equal0~3_combout\);

-- Location: FF_X6_Y5_N7
\seg_static|cnt_wait[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~inputclkctrl_outclk\,
	d => \seg_static|cnt_wait~7_combout\,
	clrn => \sys_rst_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \seg_static|cnt_wait\(14));

-- Location: FF_X6_Y5_N3
\seg_static|cnt_wait[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~inputclkctrl_outclk\,
	d => \seg_static|cnt_wait~11_combout\,
	clrn => \sys_rst_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \seg_static|cnt_wait\(6));

-- Location: LCCOMB_X6_Y5_N12
\seg_static|Equal0~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \seg_static|Equal0~6_combout\ = (!\seg_static|cnt_wait\(7) & (!\seg_static|cnt_wait\(9) & (!\seg_static|cnt_wait\(8) & !\seg_static|cnt_wait\(6))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \seg_static|cnt_wait\(7),
	datab => \seg_static|cnt_wait\(9),
	datac => \seg_static|cnt_wait\(8),
	datad => \seg_static|cnt_wait\(6),
	combout => \seg_static|Equal0~6_combout\);

-- Location: FF_X5_Y5_N11
\seg_static|cnt_wait[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~inputclkctrl_outclk\,
	d => \seg_static|Add0~8_combout\,
	clrn => \sys_rst_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \seg_static|cnt_wait\(5));

-- Location: LCCOMB_X6_Y4_N20
\seg_static|cnt_wait~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \seg_static|cnt_wait~2_combout\ = (\seg_static|Add0~40_combout\ & !\seg_static|Equal0~9_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \seg_static|Add0~40_combout\,
	datad => \seg_static|Equal0~9_combout\,
	combout => \seg_static|cnt_wait~2_combout\);

-- Location: LCCOMB_X6_Y4_N6
\seg_static|cnt_wait~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \seg_static|cnt_wait~3_combout\ = (!\seg_static|Equal0~9_combout\ & \seg_static|Add0~38_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \seg_static|Equal0~9_combout\,
	datad => \seg_static|Add0~38_combout\,
	combout => \seg_static|cnt_wait~3_combout\);

-- Location: LCCOMB_X6_Y4_N4
\seg_static|cnt_wait~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \seg_static|cnt_wait~4_combout\ = (\seg_static|Add0~36_combout\ & !\seg_static|Equal0~9_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \seg_static|Add0~36_combout\,
	datad => \seg_static|Equal0~9_combout\,
	combout => \seg_static|cnt_wait~4_combout\);

-- Location: LCCOMB_X6_Y5_N6
\seg_static|cnt_wait~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \seg_static|cnt_wait~7_combout\ = (\seg_static|Add0~26_combout\ & !\seg_static|Equal0~9_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \seg_static|Add0~26_combout\,
	datad => \seg_static|Equal0~9_combout\,
	combout => \seg_static|cnt_wait~7_combout\);

-- Location: LCCOMB_X6_Y5_N2
\seg_static|cnt_wait~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \seg_static|cnt_wait~11_combout\ = (\seg_static|Add0~10_combout\ & !\seg_static|Equal0~9_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \seg_static|Add0~10_combout\,
	datad => \seg_static|Equal0~9_combout\,
	combout => \seg_static|cnt_wait~11_combout\);

-- Location: IOOBUF_X7_Y0_N2
\stcp~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \hc595_ctrl|stcp~q\,
	devoe => ww_devoe,
	o => \stcp~output_o\);

-- Location: IOOBUF_X5_Y0_N23
\shcp~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \hc595_ctrl|shcp~q\,
	devoe => ww_devoe,
	o => \shcp~output_o\);

-- Location: IOOBUF_X13_Y0_N2
\ds~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \hc595_ctrl|ds~q\,
	devoe => ww_devoe,
	o => \ds~output_o\);

-- Location: IOOBUF_X34_Y10_N9
\oe~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_sys_rst_n~input_o\,
	devoe => ww_devoe,
	o => \oe~output_o\);

-- Location: IOIBUF_X0_Y11_N8
\sys_clk~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_sys_clk,
	o => \sys_clk~input_o\);

-- Location: CLKCTRL_G2
\sys_clk~inputclkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \sys_clk~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \sys_clk~inputclkctrl_outclk\);

-- Location: LCCOMB_X5_Y5_N0
\hc595_ctrl|cnt_4[0]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \hc595_ctrl|cnt_4[0]~0_combout\ = !\hc595_ctrl|cnt_4\(0)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \hc595_ctrl|cnt_4\(0),
	combout => \hc595_ctrl|cnt_4[0]~0_combout\);

-- Location: IOIBUF_X34_Y12_N15
\sys_rst_n~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_sys_rst_n,
	o => \sys_rst_n~input_o\);

-- Location: CLKCTRL_G9
\sys_rst_n~inputclkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \sys_rst_n~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \sys_rst_n~inputclkctrl_outclk\);

-- Location: FF_X5_Y5_N1
\hc595_ctrl|cnt_4[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~inputclkctrl_outclk\,
	d => \hc595_ctrl|cnt_4[0]~0_combout\,
	clrn => \sys_rst_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \hc595_ctrl|cnt_4\(0));

-- Location: LCCOMB_X7_Y4_N2
\hc595_ctrl|cnt_bit[0]~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \hc595_ctrl|cnt_bit[0]~6_combout\ = \hc595_ctrl|cnt_bit\(0) $ (((\hc595_ctrl|cnt_4\(1) & \hc595_ctrl|cnt_4\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \hc595_ctrl|cnt_4\(1),
	datac => \hc595_ctrl|cnt_bit\(0),
	datad => \hc595_ctrl|cnt_4\(0),
	combout => \hc595_ctrl|cnt_bit[0]~6_combout\);

-- Location: FF_X7_Y4_N3
\hc595_ctrl|cnt_bit[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~inputclkctrl_outclk\,
	d => \hc595_ctrl|cnt_bit[0]~6_combout\,
	clrn => \sys_rst_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \hc595_ctrl|cnt_bit\(0));

-- Location: LCCOMB_X7_Y4_N8
\hc595_ctrl|cnt_bit[1]~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \hc595_ctrl|cnt_bit[1]~5_combout\ = (\hc595_ctrl|Equal1~0_combout\ & (!\hc595_ctrl|always2~1_combout\ & (\hc595_ctrl|cnt_bit\(0) $ (\hc595_ctrl|cnt_bit\(1))))) # (!\hc595_ctrl|Equal1~0_combout\ & (((\hc595_ctrl|cnt_bit\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000001111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \hc595_ctrl|Equal1~0_combout\,
	datab => \hc595_ctrl|cnt_bit\(0),
	datac => \hc595_ctrl|cnt_bit\(1),
	datad => \hc595_ctrl|always2~1_combout\,
	combout => \hc595_ctrl|cnt_bit[1]~5_combout\);

-- Location: FF_X7_Y4_N9
\hc595_ctrl|cnt_bit[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~inputclkctrl_outclk\,
	d => \hc595_ctrl|cnt_bit[1]~5_combout\,
	clrn => \sys_rst_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \hc595_ctrl|cnt_bit\(1));

-- Location: LCCOMB_X7_Y4_N16
\hc595_ctrl|always2~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \hc595_ctrl|always2~0_combout\ = (\hc595_ctrl|cnt_bit\(1) & \hc595_ctrl|cnt_bit\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \hc595_ctrl|cnt_bit\(1),
	datad => \hc595_ctrl|cnt_bit\(0),
	combout => \hc595_ctrl|always2~0_combout\);

-- Location: LCCOMB_X7_Y4_N18
\hc595_ctrl|cnt_bit[2]~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \hc595_ctrl|cnt_bit[2]~7_combout\ = \hc595_ctrl|cnt_bit\(2) $ (((\hc595_ctrl|cnt_4\(1) & (\hc595_ctrl|always2~0_combout\ & \hc595_ctrl|cnt_4\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \hc595_ctrl|cnt_4\(1),
	datab => \hc595_ctrl|always2~0_combout\,
	datac => \hc595_ctrl|cnt_bit\(2),
	datad => \hc595_ctrl|cnt_4\(0),
	combout => \hc595_ctrl|cnt_bit[2]~7_combout\);

-- Location: FF_X7_Y4_N19
\hc595_ctrl|cnt_bit[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~inputclkctrl_outclk\,
	d => \hc595_ctrl|cnt_bit[2]~7_combout\,
	clrn => \sys_rst_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \hc595_ctrl|cnt_bit\(2));

-- Location: LCCOMB_X7_Y4_N20
\hc595_ctrl|cnt_bit[3]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \hc595_ctrl|cnt_bit[3]~4_combout\ = \hc595_ctrl|cnt_bit\(3) $ (((\hc595_ctrl|Equal1~0_combout\ & (\hc595_ctrl|always2~0_combout\ & \hc595_ctrl|cnt_bit\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \hc595_ctrl|Equal1~0_combout\,
	datab => \hc595_ctrl|always2~0_combout\,
	datac => \hc595_ctrl|cnt_bit\(3),
	datad => \hc595_ctrl|cnt_bit\(2),
	combout => \hc595_ctrl|cnt_bit[3]~4_combout\);

-- Location: FF_X7_Y4_N21
\hc595_ctrl|cnt_bit[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~inputclkctrl_outclk\,
	d => \hc595_ctrl|cnt_bit[3]~4_combout\,
	clrn => \sys_rst_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \hc595_ctrl|cnt_bit\(3));

-- Location: LCCOMB_X7_Y4_N28
\hc595_ctrl|always2~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \hc595_ctrl|always2~1_combout\ = (\hc595_ctrl|Equal1~0_combout\ & (\hc595_ctrl|cnt_bit\(2) & (\hc595_ctrl|cnt_bit\(3) & \hc595_ctrl|always2~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \hc595_ctrl|Equal1~0_combout\,
	datab => \hc595_ctrl|cnt_bit\(2),
	datac => \hc595_ctrl|cnt_bit\(3),
	datad => \hc595_ctrl|always2~0_combout\,
	combout => \hc595_ctrl|always2~1_combout\);

-- Location: FF_X7_Y4_N29
\hc595_ctrl|stcp\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~inputclkctrl_outclk\,
	d => \hc595_ctrl|always2~1_combout\,
	clrn => \sys_rst_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \hc595_ctrl|stcp~q\);

-- Location: LCCOMB_X5_Y5_N2
\seg_static|Add0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \seg_static|Add0~0_combout\ = (\hc595_ctrl|cnt_4\(1) & (\hc595_ctrl|cnt_4\(0) $ (VCC))) # (!\hc595_ctrl|cnt_4\(1) & (\hc595_ctrl|cnt_4\(0) & VCC))
-- \seg_static|Add0~1\ = CARRY((\hc595_ctrl|cnt_4\(1) & \hc595_ctrl|cnt_4\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \hc595_ctrl|cnt_4\(1),
	datab => \hc595_ctrl|cnt_4\(0),
	datad => VCC,
	combout => \seg_static|Add0~0_combout\,
	cout => \seg_static|Add0~1\);

-- Location: FF_X5_Y5_N3
\hc595_ctrl|cnt_4[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~inputclkctrl_outclk\,
	d => \seg_static|Add0~0_combout\,
	clrn => \sys_rst_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \hc595_ctrl|cnt_4\(1));

-- Location: LCCOMB_X6_Y4_N28
\hc595_ctrl|shcp~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \hc595_ctrl|shcp~feeder_combout\ = \hc595_ctrl|cnt_4\(1)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \hc595_ctrl|cnt_4\(1),
	combout => \hc595_ctrl|shcp~feeder_combout\);

-- Location: FF_X6_Y4_N29
\hc595_ctrl|shcp\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~inputclkctrl_outclk\,
	d => \hc595_ctrl|shcp~feeder_combout\,
	clrn => \sys_rst_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \hc595_ctrl|shcp~q\);

-- Location: LCCOMB_X9_Y4_N12
\seg_static|Add1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \seg_static|Add1~0_combout\ = \seg_static|num\(0) $ (VCC)
-- \seg_static|Add1~1\ = CARRY(\seg_static|num\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \seg_static|num\(0),
	datad => VCC,
	combout => \seg_static|Add1~0_combout\,
	cout => \seg_static|Add1~1\);

-- Location: LCCOMB_X9_Y4_N14
\seg_static|Add1~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \seg_static|Add1~2_combout\ = (\seg_static|num\(1) & (!\seg_static|Add1~1\)) # (!\seg_static|num\(1) & ((\seg_static|Add1~1\) # (GND)))
-- \seg_static|Add1~3\ = CARRY((!\seg_static|Add1~1\) # (!\seg_static|num\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \seg_static|num\(1),
	datad => VCC,
	cin => \seg_static|Add1~1\,
	combout => \seg_static|Add1~2_combout\,
	cout => \seg_static|Add1~3\);

-- Location: LCCOMB_X5_Y5_N4
\seg_static|Add0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \seg_static|Add0~2_combout\ = (\seg_static|cnt_wait\(2) & (!\seg_static|Add0~1\)) # (!\seg_static|cnt_wait\(2) & ((\seg_static|Add0~1\) # (GND)))
-- \seg_static|Add0~3\ = CARRY((!\seg_static|Add0~1\) # (!\seg_static|cnt_wait\(2)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \seg_static|cnt_wait\(2),
	datad => VCC,
	cin => \seg_static|Add0~1\,
	combout => \seg_static|Add0~2_combout\,
	cout => \seg_static|Add0~3\);

-- Location: FF_X5_Y5_N5
\seg_static|cnt_wait[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~inputclkctrl_outclk\,
	d => \seg_static|Add0~2_combout\,
	clrn => \sys_rst_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \seg_static|cnt_wait\(2));

-- Location: LCCOMB_X5_Y5_N6
\seg_static|Add0~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \seg_static|Add0~4_combout\ = (\seg_static|cnt_wait\(3) & (\seg_static|Add0~3\ $ (GND))) # (!\seg_static|cnt_wait\(3) & (!\seg_static|Add0~3\ & VCC))
-- \seg_static|Add0~5\ = CARRY((\seg_static|cnt_wait\(3) & !\seg_static|Add0~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \seg_static|cnt_wait\(3),
	datad => VCC,
	cin => \seg_static|Add0~3\,
	combout => \seg_static|Add0~4_combout\,
	cout => \seg_static|Add0~5\);

-- Location: LCCOMB_X5_Y5_N8
\seg_static|Add0~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \seg_static|Add0~6_combout\ = (\seg_static|cnt_wait\(4) & (!\seg_static|Add0~5\)) # (!\seg_static|cnt_wait\(4) & ((\seg_static|Add0~5\) # (GND)))
-- \seg_static|Add0~7\ = CARRY((!\seg_static|Add0~5\) # (!\seg_static|cnt_wait\(4)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \seg_static|cnt_wait\(4),
	datad => VCC,
	cin => \seg_static|Add0~5\,
	combout => \seg_static|Add0~6_combout\,
	cout => \seg_static|Add0~7\);

-- Location: FF_X5_Y5_N9
\seg_static|cnt_wait[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~inputclkctrl_outclk\,
	d => \seg_static|Add0~6_combout\,
	clrn => \sys_rst_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \seg_static|cnt_wait\(4));

-- Location: LCCOMB_X5_Y5_N14
\seg_static|Add0~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \seg_static|Add0~12_combout\ = (\seg_static|cnt_wait\(7) & (\seg_static|Add0~11\ $ (GND))) # (!\seg_static|cnt_wait\(7) & (!\seg_static|Add0~11\ & VCC))
-- \seg_static|Add0~13\ = CARRY((\seg_static|cnt_wait\(7) & !\seg_static|Add0~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \seg_static|cnt_wait\(7),
	datad => VCC,
	cin => \seg_static|Add0~11\,
	combout => \seg_static|Add0~12_combout\,
	cout => \seg_static|Add0~13\);

-- Location: FF_X5_Y5_N15
\seg_static|cnt_wait[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~inputclkctrl_outclk\,
	d => \seg_static|Add0~12_combout\,
	clrn => \sys_rst_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \seg_static|cnt_wait\(7));

-- Location: LCCOMB_X5_Y5_N16
\seg_static|Add0~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \seg_static|Add0~14_combout\ = (\seg_static|cnt_wait\(8) & (!\seg_static|Add0~13\)) # (!\seg_static|cnt_wait\(8) & ((\seg_static|Add0~13\) # (GND)))
-- \seg_static|Add0~15\ = CARRY((!\seg_static|Add0~13\) # (!\seg_static|cnt_wait\(8)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \seg_static|cnt_wait\(8),
	datad => VCC,
	cin => \seg_static|Add0~13\,
	combout => \seg_static|Add0~14_combout\,
	cout => \seg_static|Add0~15\);

-- Location: FF_X5_Y5_N17
\seg_static|cnt_wait[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~inputclkctrl_outclk\,
	d => \seg_static|Add0~14_combout\,
	clrn => \sys_rst_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \seg_static|cnt_wait\(8));

-- Location: LCCOMB_X5_Y5_N18
\seg_static|Add0~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \seg_static|Add0~16_combout\ = (\seg_static|cnt_wait\(9) & (\seg_static|Add0~15\ $ (GND))) # (!\seg_static|cnt_wait\(9) & (!\seg_static|Add0~15\ & VCC))
-- \seg_static|Add0~17\ = CARRY((\seg_static|cnt_wait\(9) & !\seg_static|Add0~15\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \seg_static|cnt_wait\(9),
	datad => VCC,
	cin => \seg_static|Add0~15\,
	combout => \seg_static|Add0~16_combout\,
	cout => \seg_static|Add0~17\);

-- Location: FF_X5_Y5_N19
\seg_static|cnt_wait[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~inputclkctrl_outclk\,
	d => \seg_static|Add0~16_combout\,
	clrn => \sys_rst_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \seg_static|cnt_wait\(9));

-- Location: LCCOMB_X5_Y5_N20
\seg_static|Add0~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \seg_static|Add0~18_combout\ = (\seg_static|cnt_wait\(10) & (!\seg_static|Add0~17\)) # (!\seg_static|cnt_wait\(10) & ((\seg_static|Add0~17\) # (GND)))
-- \seg_static|Add0~19\ = CARRY((!\seg_static|Add0~17\) # (!\seg_static|cnt_wait\(10)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \seg_static|cnt_wait\(10),
	datad => VCC,
	cin => \seg_static|Add0~17\,
	combout => \seg_static|Add0~18_combout\,
	cout => \seg_static|Add0~19\);

-- Location: FF_X5_Y5_N21
\seg_static|cnt_wait[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~inputclkctrl_outclk\,
	d => \seg_static|Add0~18_combout\,
	clrn => \sys_rst_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \seg_static|cnt_wait\(10));

-- Location: LCCOMB_X5_Y5_N22
\seg_static|Add0~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \seg_static|Add0~20_combout\ = (\seg_static|cnt_wait\(11) & (\seg_static|Add0~19\ $ (GND))) # (!\seg_static|cnt_wait\(11) & (!\seg_static|Add0~19\ & VCC))
-- \seg_static|Add0~21\ = CARRY((\seg_static|cnt_wait\(11) & !\seg_static|Add0~19\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \seg_static|cnt_wait\(11),
	datad => VCC,
	cin => \seg_static|Add0~19\,
	combout => \seg_static|Add0~20_combout\,
	cout => \seg_static|Add0~21\);

-- Location: LCCOMB_X6_Y5_N10
\seg_static|cnt_wait~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \seg_static|cnt_wait~10_combout\ = (\seg_static|Add0~20_combout\ & !\seg_static|Equal0~9_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \seg_static|Add0~20_combout\,
	datad => \seg_static|Equal0~9_combout\,
	combout => \seg_static|cnt_wait~10_combout\);

-- Location: FF_X6_Y5_N11
\seg_static|cnt_wait[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~inputclkctrl_outclk\,
	d => \seg_static|cnt_wait~10_combout\,
	clrn => \sys_rst_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \seg_static|cnt_wait\(11));

-- Location: LCCOMB_X5_Y5_N24
\seg_static|Add0~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \seg_static|Add0~22_combout\ = (\seg_static|cnt_wait\(12) & (!\seg_static|Add0~21\)) # (!\seg_static|cnt_wait\(12) & ((\seg_static|Add0~21\) # (GND)))
-- \seg_static|Add0~23\ = CARRY((!\seg_static|Add0~21\) # (!\seg_static|cnt_wait\(12)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \seg_static|cnt_wait\(12),
	datad => VCC,
	cin => \seg_static|Add0~21\,
	combout => \seg_static|Add0~22_combout\,
	cout => \seg_static|Add0~23\);

-- Location: LCCOMB_X5_Y5_N26
\seg_static|Add0~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \seg_static|Add0~24_combout\ = (\seg_static|cnt_wait\(13) & (\seg_static|Add0~23\ $ (GND))) # (!\seg_static|cnt_wait\(13) & (!\seg_static|Add0~23\ & VCC))
-- \seg_static|Add0~25\ = CARRY((\seg_static|cnt_wait\(13) & !\seg_static|Add0~23\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \seg_static|cnt_wait\(13),
	datad => VCC,
	cin => \seg_static|Add0~23\,
	combout => \seg_static|Add0~24_combout\,
	cout => \seg_static|Add0~25\);

-- Location: LCCOMB_X6_Y5_N22
\seg_static|cnt_wait~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \seg_static|cnt_wait~8_combout\ = (\seg_static|Add0~24_combout\ & !\seg_static|Equal0~9_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \seg_static|Add0~24_combout\,
	datad => \seg_static|Equal0~9_combout\,
	combout => \seg_static|cnt_wait~8_combout\);

-- Location: FF_X6_Y5_N23
\seg_static|cnt_wait[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~inputclkctrl_outclk\,
	d => \seg_static|cnt_wait~8_combout\,
	clrn => \sys_rst_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \seg_static|cnt_wait\(13));

-- Location: LCCOMB_X5_Y5_N30
\seg_static|Add0~28\ : cycloneive_lcell_comb
-- Equation(s):
-- \seg_static|Add0~28_combout\ = (\seg_static|cnt_wait\(15) & (\seg_static|Add0~27\ $ (GND))) # (!\seg_static|cnt_wait\(15) & (!\seg_static|Add0~27\ & VCC))
-- \seg_static|Add0~29\ = CARRY((\seg_static|cnt_wait\(15) & !\seg_static|Add0~27\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \seg_static|cnt_wait\(15),
	datad => VCC,
	cin => \seg_static|Add0~27\,
	combout => \seg_static|Add0~28_combout\,
	cout => \seg_static|Add0~29\);

-- Location: LCCOMB_X5_Y4_N0
\seg_static|Add0~30\ : cycloneive_lcell_comb
-- Equation(s):
-- \seg_static|Add0~30_combout\ = (\seg_static|cnt_wait\(16) & (!\seg_static|Add0~29\)) # (!\seg_static|cnt_wait\(16) & ((\seg_static|Add0~29\) # (GND)))
-- \seg_static|Add0~31\ = CARRY((!\seg_static|Add0~29\) # (!\seg_static|cnt_wait\(16)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \seg_static|cnt_wait\(16),
	datad => VCC,
	cin => \seg_static|Add0~29\,
	combout => \seg_static|Add0~30_combout\,
	cout => \seg_static|Add0~31\);

-- Location: LCCOMB_X6_Y5_N24
\seg_static|cnt_wait~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \seg_static|cnt_wait~6_combout\ = (\seg_static|Add0~30_combout\ & !\seg_static|Equal0~9_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \seg_static|Add0~30_combout\,
	datad => \seg_static|Equal0~9_combout\,
	combout => \seg_static|cnt_wait~6_combout\);

-- Location: FF_X6_Y5_N25
\seg_static|cnt_wait[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~inputclkctrl_outclk\,
	d => \seg_static|cnt_wait~6_combout\,
	clrn => \sys_rst_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \seg_static|cnt_wait\(16));

-- Location: LCCOMB_X5_Y4_N2
\seg_static|Add0~32\ : cycloneive_lcell_comb
-- Equation(s):
-- \seg_static|Add0~32_combout\ = (\seg_static|cnt_wait\(17) & (\seg_static|Add0~31\ $ (GND))) # (!\seg_static|cnt_wait\(17) & (!\seg_static|Add0~31\ & VCC))
-- \seg_static|Add0~33\ = CARRY((\seg_static|cnt_wait\(17) & !\seg_static|Add0~31\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \seg_static|cnt_wait\(17),
	datad => VCC,
	cin => \seg_static|Add0~31\,
	combout => \seg_static|Add0~32_combout\,
	cout => \seg_static|Add0~33\);

-- Location: FF_X5_Y4_N3
\seg_static|cnt_wait[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~inputclkctrl_outclk\,
	d => \seg_static|Add0~32_combout\,
	clrn => \sys_rst_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \seg_static|cnt_wait\(17));

-- Location: LCCOMB_X5_Y4_N4
\seg_static|Add0~34\ : cycloneive_lcell_comb
-- Equation(s):
-- \seg_static|Add0~34_combout\ = (\seg_static|cnt_wait\(18) & (!\seg_static|Add0~33\)) # (!\seg_static|cnt_wait\(18) & ((\seg_static|Add0~33\) # (GND)))
-- \seg_static|Add0~35\ = CARRY((!\seg_static|Add0~33\) # (!\seg_static|cnt_wait\(18)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \seg_static|cnt_wait\(18),
	datad => VCC,
	cin => \seg_static|Add0~33\,
	combout => \seg_static|Add0~34_combout\,
	cout => \seg_static|Add0~35\);

-- Location: LCCOMB_X6_Y4_N22
\seg_static|cnt_wait~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \seg_static|cnt_wait~5_combout\ = (\seg_static|Add0~34_combout\ & !\seg_static|Equal0~9_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \seg_static|Add0~34_combout\,
	datad => \seg_static|Equal0~9_combout\,
	combout => \seg_static|cnt_wait~5_combout\);

-- Location: FF_X6_Y4_N23
\seg_static|cnt_wait[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~inputclkctrl_outclk\,
	d => \seg_static|cnt_wait~5_combout\,
	clrn => \sys_rst_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \seg_static|cnt_wait\(18));

-- Location: LCCOMB_X5_Y4_N12
\seg_static|Add0~42\ : cycloneive_lcell_comb
-- Equation(s):
-- \seg_static|Add0~42_combout\ = (\seg_static|cnt_wait\(22) & (!\seg_static|Add0~41\)) # (!\seg_static|cnt_wait\(22) & ((\seg_static|Add0~41\) # (GND)))
-- \seg_static|Add0~43\ = CARRY((!\seg_static|Add0~41\) # (!\seg_static|cnt_wait\(22)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \seg_static|cnt_wait\(22),
	datad => VCC,
	cin => \seg_static|Add0~41\,
	combout => \seg_static|Add0~42_combout\,
	cout => \seg_static|Add0~43\);

-- Location: LCCOMB_X6_Y4_N8
\seg_static|cnt_wait~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \seg_static|cnt_wait~1_combout\ = (!\seg_static|Equal0~9_combout\ & \seg_static|Add0~42_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \seg_static|Equal0~9_combout\,
	datad => \seg_static|Add0~42_combout\,
	combout => \seg_static|cnt_wait~1_combout\);

-- Location: FF_X6_Y4_N9
\seg_static|cnt_wait[22]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~inputclkctrl_outclk\,
	d => \seg_static|cnt_wait~1_combout\,
	clrn => \sys_rst_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \seg_static|cnt_wait\(22));

-- Location: LCCOMB_X5_Y4_N14
\seg_static|Add0~44\ : cycloneive_lcell_comb
-- Equation(s):
-- \seg_static|Add0~44_combout\ = (\seg_static|cnt_wait\(23) & (\seg_static|Add0~43\ $ (GND))) # (!\seg_static|cnt_wait\(23) & (!\seg_static|Add0~43\ & VCC))
-- \seg_static|Add0~45\ = CARRY((\seg_static|cnt_wait\(23) & !\seg_static|Add0~43\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \seg_static|cnt_wait\(23),
	datad => VCC,
	cin => \seg_static|Add0~43\,
	combout => \seg_static|Add0~44_combout\,
	cout => \seg_static|Add0~45\);

-- Location: FF_X5_Y4_N15
\seg_static|cnt_wait[23]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~inputclkctrl_outclk\,
	d => \seg_static|Add0~44_combout\,
	clrn => \sys_rst_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \seg_static|cnt_wait\(23));

-- Location: LCCOMB_X5_Y4_N16
\seg_static|Add0~46\ : cycloneive_lcell_comb
-- Equation(s):
-- \seg_static|Add0~46_combout\ = (\seg_static|cnt_wait\(24) & (!\seg_static|Add0~45\)) # (!\seg_static|cnt_wait\(24) & ((\seg_static|Add0~45\) # (GND)))
-- \seg_static|Add0~47\ = CARRY((!\seg_static|Add0~45\) # (!\seg_static|cnt_wait\(24)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \seg_static|cnt_wait\(24),
	datad => VCC,
	cin => \seg_static|Add0~45\,
	combout => \seg_static|Add0~46_combout\,
	cout => \seg_static|Add0~47\);

-- Location: LCCOMB_X6_Y4_N10
\seg_static|cnt_wait~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \seg_static|cnt_wait~0_combout\ = (\seg_static|Add0~46_combout\ & !\seg_static|Equal0~9_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \seg_static|Add0~46_combout\,
	datad => \seg_static|Equal0~9_combout\,
	combout => \seg_static|cnt_wait~0_combout\);

-- Location: FF_X6_Y4_N11
\seg_static|cnt_wait[24]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~inputclkctrl_outclk\,
	d => \seg_static|cnt_wait~0_combout\,
	clrn => \sys_rst_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \seg_static|cnt_wait\(24));

-- Location: LCCOMB_X5_Y4_N18
\seg_static|Add0~48\ : cycloneive_lcell_comb
-- Equation(s):
-- \seg_static|Add0~48_combout\ = (\seg_static|cnt_wait\(25) & (\seg_static|Add0~47\ $ (GND))) # (!\seg_static|cnt_wait\(25) & (!\seg_static|Add0~47\ & VCC))
-- \seg_static|Add0~49\ = CARRY((\seg_static|cnt_wait\(25) & !\seg_static|Add0~47\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \seg_static|cnt_wait\(25),
	datad => VCC,
	cin => \seg_static|Add0~47\,
	combout => \seg_static|Add0~48_combout\,
	cout => \seg_static|Add0~49\);

-- Location: FF_X5_Y4_N19
\seg_static|cnt_wait[25]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~inputclkctrl_outclk\,
	d => \seg_static|Add0~48_combout\,
	clrn => \sys_rst_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \seg_static|cnt_wait\(25));

-- Location: LCCOMB_X6_Y4_N18
\seg_static|Equal0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \seg_static|Equal0~2_combout\ = (!\seg_static|cnt_wait\(23) & (!\seg_static|cnt_wait\(25) & (\seg_static|cnt_wait\(22) & \seg_static|cnt_wait\(24))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \seg_static|cnt_wait\(23),
	datab => \seg_static|cnt_wait\(25),
	datac => \seg_static|cnt_wait\(22),
	datad => \seg_static|cnt_wait\(24),
	combout => \seg_static|Equal0~2_combout\);

-- Location: LCCOMB_X6_Y5_N4
\seg_static|cnt_wait~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \seg_static|cnt_wait~9_combout\ = (\seg_static|Add0~22_combout\ & !\seg_static|Equal0~9_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \seg_static|Add0~22_combout\,
	datad => \seg_static|Equal0~9_combout\,
	combout => \seg_static|cnt_wait~9_combout\);

-- Location: FF_X6_Y5_N5
\seg_static|cnt_wait[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~inputclkctrl_outclk\,
	d => \seg_static|cnt_wait~9_combout\,
	clrn => \sys_rst_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \seg_static|cnt_wait\(12));

-- Location: LCCOMB_X6_Y5_N0
\seg_static|Equal0~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \seg_static|Equal0~5_combout\ = (\seg_static|cnt_wait\(11) & (\seg_static|cnt_wait\(12) & (\seg_static|cnt_wait\(13) & !\seg_static|cnt_wait\(10))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \seg_static|cnt_wait\(11),
	datab => \seg_static|cnt_wait\(12),
	datac => \seg_static|cnt_wait\(13),
	datad => \seg_static|cnt_wait\(10),
	combout => \seg_static|Equal0~5_combout\);

-- Location: FF_X5_Y5_N7
\seg_static|cnt_wait[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~inputclkctrl_outclk\,
	d => \seg_static|Add0~4_combout\,
	clrn => \sys_rst_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \seg_static|cnt_wait\(3));

-- Location: LCCOMB_X6_Y5_N26
\seg_static|Equal0~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \seg_static|Equal0~7_combout\ = (\seg_static|cnt_wait\(5) & (\seg_static|cnt_wait\(3) & (\seg_static|cnt_wait\(2) & \seg_static|cnt_wait\(4))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \seg_static|cnt_wait\(5),
	datab => \seg_static|cnt_wait\(3),
	datac => \seg_static|cnt_wait\(2),
	datad => \seg_static|cnt_wait\(4),
	combout => \seg_static|Equal0~7_combout\);

-- Location: FF_X5_Y5_N31
\seg_static|cnt_wait[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~inputclkctrl_outclk\,
	d => \seg_static|Add0~28_combout\,
	clrn => \sys_rst_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \seg_static|cnt_wait\(15));

-- Location: LCCOMB_X6_Y5_N28
\seg_static|Equal0~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \seg_static|Equal0~4_combout\ = (\seg_static|cnt_wait\(14) & (\seg_static|cnt_wait\(16) & (!\seg_static|cnt_wait\(15) & !\seg_static|cnt_wait\(17))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \seg_static|cnt_wait\(14),
	datab => \seg_static|cnt_wait\(16),
	datac => \seg_static|cnt_wait\(15),
	datad => \seg_static|cnt_wait\(17),
	combout => \seg_static|Equal0~4_combout\);

-- Location: LCCOMB_X6_Y5_N8
\seg_static|Equal0~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \seg_static|Equal0~8_combout\ = (\seg_static|Equal0~6_combout\ & (\seg_static|Equal0~5_combout\ & (\seg_static|Equal0~7_combout\ & \seg_static|Equal0~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \seg_static|Equal0~6_combout\,
	datab => \seg_static|Equal0~5_combout\,
	datac => \seg_static|Equal0~7_combout\,
	datad => \seg_static|Equal0~4_combout\,
	combout => \seg_static|Equal0~8_combout\);

-- Location: LCCOMB_X5_Y4_N20
\seg_static|Add0~50\ : cycloneive_lcell_comb
-- Equation(s):
-- \seg_static|Add0~50_combout\ = (\seg_static|cnt_wait\(26) & (!\seg_static|Add0~49\)) # (!\seg_static|cnt_wait\(26) & ((\seg_static|Add0~49\) # (GND)))
-- \seg_static|Add0~51\ = CARRY((!\seg_static|Add0~49\) # (!\seg_static|cnt_wait\(26)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \seg_static|cnt_wait\(26),
	datad => VCC,
	cin => \seg_static|Add0~49\,
	combout => \seg_static|Add0~50_combout\,
	cout => \seg_static|Add0~51\);

-- Location: FF_X5_Y4_N21
\seg_static|cnt_wait[26]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~inputclkctrl_outclk\,
	d => \seg_static|Add0~50_combout\,
	clrn => \sys_rst_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \seg_static|cnt_wait\(26));

-- Location: LCCOMB_X5_Y4_N22
\seg_static|Add0~52\ : cycloneive_lcell_comb
-- Equation(s):
-- \seg_static|Add0~52_combout\ = (\seg_static|cnt_wait\(27) & (\seg_static|Add0~51\ $ (GND))) # (!\seg_static|cnt_wait\(27) & (!\seg_static|Add0~51\ & VCC))
-- \seg_static|Add0~53\ = CARRY((\seg_static|cnt_wait\(27) & !\seg_static|Add0~51\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \seg_static|cnt_wait\(27),
	datad => VCC,
	cin => \seg_static|Add0~51\,
	combout => \seg_static|Add0~52_combout\,
	cout => \seg_static|Add0~53\);

-- Location: LCCOMB_X5_Y4_N24
\seg_static|Add0~54\ : cycloneive_lcell_comb
-- Equation(s):
-- \seg_static|Add0~54_combout\ = (\seg_static|cnt_wait\(28) & (!\seg_static|Add0~53\)) # (!\seg_static|cnt_wait\(28) & ((\seg_static|Add0~53\) # (GND)))
-- \seg_static|Add0~55\ = CARRY((!\seg_static|Add0~53\) # (!\seg_static|cnt_wait\(28)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \seg_static|cnt_wait\(28),
	datad => VCC,
	cin => \seg_static|Add0~53\,
	combout => \seg_static|Add0~54_combout\,
	cout => \seg_static|Add0~55\);

-- Location: FF_X5_Y4_N25
\seg_static|cnt_wait[28]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~inputclkctrl_outclk\,
	d => \seg_static|Add0~54_combout\,
	clrn => \sys_rst_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \seg_static|cnt_wait\(28));

-- Location: LCCOMB_X5_Y4_N26
\seg_static|Add0~56\ : cycloneive_lcell_comb
-- Equation(s):
-- \seg_static|Add0~56_combout\ = (\seg_static|cnt_wait\(29) & (\seg_static|Add0~55\ $ (GND))) # (!\seg_static|cnt_wait\(29) & (!\seg_static|Add0~55\ & VCC))
-- \seg_static|Add0~57\ = CARRY((\seg_static|cnt_wait\(29) & !\seg_static|Add0~55\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \seg_static|cnt_wait\(29),
	datad => VCC,
	cin => \seg_static|Add0~55\,
	combout => \seg_static|Add0~56_combout\,
	cout => \seg_static|Add0~57\);

-- Location: FF_X5_Y4_N29
\seg_static|cnt_wait[30]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~inputclkctrl_outclk\,
	d => \seg_static|Add0~58_combout\,
	clrn => \sys_rst_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \seg_static|cnt_wait\(30));

-- Location: FF_X5_Y4_N23
\seg_static|cnt_wait[27]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~inputclkctrl_outclk\,
	d => \seg_static|Add0~52_combout\,
	clrn => \sys_rst_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \seg_static|cnt_wait\(27));

-- Location: FF_X5_Y4_N27
\seg_static|cnt_wait[29]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~inputclkctrl_outclk\,
	d => \seg_static|Add0~56_combout\,
	clrn => \sys_rst_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \seg_static|cnt_wait\(29));

-- Location: LCCOMB_X6_Y4_N26
\seg_static|Equal0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \seg_static|Equal0~0_combout\ = (!\seg_static|cnt_wait\(28) & (!\seg_static|cnt_wait\(27) & (!\seg_static|cnt_wait\(29) & !\seg_static|cnt_wait\(26))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \seg_static|cnt_wait\(28),
	datab => \seg_static|cnt_wait\(27),
	datac => \seg_static|cnt_wait\(29),
	datad => \seg_static|cnt_wait\(26),
	combout => \seg_static|Equal0~0_combout\);

-- Location: LCCOMB_X6_Y4_N2
\hc595_ctrl|Equal1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \hc595_ctrl|Equal1~0_combout\ = (\hc595_ctrl|cnt_4\(0) & \hc595_ctrl|cnt_4\(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \hc595_ctrl|cnt_4\(0),
	datad => \hc595_ctrl|cnt_4\(1),
	combout => \hc595_ctrl|Equal1~0_combout\);

-- Location: LCCOMB_X6_Y4_N24
\seg_static|Equal0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \seg_static|Equal0~1_combout\ = (!\seg_static|cnt_wait\(31) & (!\seg_static|cnt_wait\(30) & (\seg_static|Equal0~0_combout\ & \hc595_ctrl|Equal1~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \seg_static|cnt_wait\(31),
	datab => \seg_static|cnt_wait\(30),
	datac => \seg_static|Equal0~0_combout\,
	datad => \hc595_ctrl|Equal1~0_combout\,
	combout => \seg_static|Equal0~1_combout\);

-- Location: LCCOMB_X6_Y4_N0
\seg_static|Equal0~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \seg_static|Equal0~9_combout\ = (\seg_static|Equal0~3_combout\ & (\seg_static|Equal0~2_combout\ & (\seg_static|Equal0~8_combout\ & \seg_static|Equal0~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \seg_static|Equal0~3_combout\,
	datab => \seg_static|Equal0~2_combout\,
	datac => \seg_static|Equal0~8_combout\,
	datad => \seg_static|Equal0~1_combout\,
	combout => \seg_static|Equal0~9_combout\);

-- Location: FF_X6_Y4_N1
\seg_static|add_flag\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~inputclkctrl_outclk\,
	d => \seg_static|Equal0~9_combout\,
	clrn => \sys_rst_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \seg_static|add_flag~q\);

-- Location: FF_X9_Y4_N15
\seg_static|num[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~inputclkctrl_outclk\,
	d => \seg_static|Add1~2_combout\,
	clrn => \sys_rst_n~inputclkctrl_outclk\,
	ena => \seg_static|add_flag~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \seg_static|num\(1));

-- Location: LCCOMB_X9_Y4_N16
\seg_static|Add1~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \seg_static|Add1~4_combout\ = (\seg_static|num\(2) & (\seg_static|Add1~3\ $ (GND))) # (!\seg_static|num\(2) & (!\seg_static|Add1~3\ & VCC))
-- \seg_static|Add1~5\ = CARRY((\seg_static|num\(2) & !\seg_static|Add1~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \seg_static|num\(2),
	datad => VCC,
	cin => \seg_static|Add1~3\,
	combout => \seg_static|Add1~4_combout\,
	cout => \seg_static|Add1~5\);

-- Location: FF_X9_Y4_N17
\seg_static|num[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~inputclkctrl_outclk\,
	d => \seg_static|Add1~4_combout\,
	clrn => \sys_rst_n~inputclkctrl_outclk\,
	ena => \seg_static|add_flag~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \seg_static|num\(2));

-- Location: LCCOMB_X9_Y4_N18
\seg_static|Add1~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \seg_static|Add1~6_combout\ = (\seg_static|num\(3) & (!\seg_static|Add1~5\)) # (!\seg_static|num\(3) & ((\seg_static|Add1~5\) # (GND)))
-- \seg_static|Add1~7\ = CARRY((!\seg_static|Add1~5\) # (!\seg_static|num\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \seg_static|num\(3),
	datad => VCC,
	cin => \seg_static|Add1~5\,
	combout => \seg_static|Add1~6_combout\,
	cout => \seg_static|Add1~7\);

-- Location: FF_X9_Y4_N19
\seg_static|num[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~inputclkctrl_outclk\,
	d => \seg_static|Add1~6_combout\,
	clrn => \sys_rst_n~inputclkctrl_outclk\,
	ena => \seg_static|add_flag~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \seg_static|num\(3));

-- Location: LCCOMB_X9_Y4_N28
\seg_static|Equal1~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \seg_static|Equal1~1_combout\ = (\seg_static|num\(0) & (\seg_static|num\(3) & (\seg_static|num\(1) & \seg_static|num\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \seg_static|num\(0),
	datab => \seg_static|num\(3),
	datac => \seg_static|num\(1),
	datad => \seg_static|num\(2),
	combout => \seg_static|Equal1~1_combout\);

-- Location: LCCOMB_X9_Y4_N20
\seg_static|Add1~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \seg_static|Add1~8_combout\ = (\seg_static|num\(4) & (\seg_static|Add1~7\ $ (GND))) # (!\seg_static|num\(4) & (!\seg_static|Add1~7\ & VCC))
-- \seg_static|Add1~9\ = CARRY((\seg_static|num\(4) & !\seg_static|Add1~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \seg_static|num\(4),
	datad => VCC,
	cin => \seg_static|Add1~7\,
	combout => \seg_static|Add1~8_combout\,
	cout => \seg_static|Add1~9\);

-- Location: LCCOMB_X9_Y4_N0
\seg_static|num~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \seg_static|num~0_combout\ = (\seg_static|Add1~8_combout\ & ((!\seg_static|Equal1~1_combout\) # (!\seg_static|Equal1~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111011100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \seg_static|Equal1~0_combout\,
	datab => \seg_static|Equal1~1_combout\,
	datad => \seg_static|Add1~8_combout\,
	combout => \seg_static|num~0_combout\);

-- Location: FF_X9_Y4_N1
\seg_static|num[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~inputclkctrl_outclk\,
	d => \seg_static|num~0_combout\,
	clrn => \sys_rst_n~inputclkctrl_outclk\,
	ena => \seg_static|add_flag~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \seg_static|num\(4));

-- Location: LCCOMB_X9_Y4_N22
\seg_static|Add1~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \seg_static|Add1~10_combout\ = (\seg_static|num\(5) & (!\seg_static|Add1~9\)) # (!\seg_static|num\(5) & ((\seg_static|Add1~9\) # (GND)))
-- \seg_static|Add1~11\ = CARRY((!\seg_static|Add1~9\) # (!\seg_static|num\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \seg_static|num\(5),
	datad => VCC,
	cin => \seg_static|Add1~9\,
	combout => \seg_static|Add1~10_combout\,
	cout => \seg_static|Add1~11\);

-- Location: FF_X9_Y4_N25
\seg_static|num[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~inputclkctrl_outclk\,
	d => \seg_static|Add1~12_combout\,
	clrn => \sys_rst_n~inputclkctrl_outclk\,
	ena => \seg_static|add_flag~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \seg_static|num\(6));

-- Location: FF_X9_Y4_N23
\seg_static|num[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~inputclkctrl_outclk\,
	d => \seg_static|Add1~10_combout\,
	clrn => \sys_rst_n~inputclkctrl_outclk\,
	ena => \seg_static|add_flag~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \seg_static|num\(5));

-- Location: LCCOMB_X9_Y4_N10
\seg_static|Equal1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \seg_static|Equal1~0_combout\ = (!\seg_static|num\(7) & (!\seg_static|num\(6) & (!\seg_static|num\(5) & !\seg_static|num\(4))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \seg_static|num\(7),
	datab => \seg_static|num\(6),
	datac => \seg_static|num\(5),
	datad => \seg_static|num\(4),
	combout => \seg_static|Equal1~0_combout\);

-- Location: FF_X9_Y4_N13
\seg_static|num[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~inputclkctrl_outclk\,
	d => \seg_static|Add1~0_combout\,
	clrn => \sys_rst_n~inputclkctrl_outclk\,
	ena => \seg_static|add_flag~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \seg_static|num\(0));

-- Location: LCCOMB_X8_Y4_N10
\seg_static|WideOr2~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \seg_static|WideOr2~0_combout\ = (\seg_static|num\(1) & (!\seg_static|num\(3) & ((\seg_static|num\(0)) # (!\seg_static|num\(2))))) # (!\seg_static|num\(1) & (\seg_static|num\(0) & (\seg_static|num\(3) $ (!\seg_static|num\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110000001010100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \seg_static|num\(3),
	datab => \seg_static|num\(1),
	datac => \seg_static|num\(0),
	datad => \seg_static|num\(2),
	combout => \seg_static|WideOr2~0_combout\);

-- Location: LCCOMB_X7_Y4_N26
\seg_static|WideOr2~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \seg_static|WideOr2~1_combout\ = (\seg_static|Equal1~0_combout\ & !\seg_static|WideOr2~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \seg_static|Equal1~0_combout\,
	datac => \seg_static|WideOr2~0_combout\,
	combout => \seg_static|WideOr2~1_combout\);

-- Location: FF_X7_Y4_N27
\seg_static|seg[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~inputclkctrl_outclk\,
	d => \seg_static|WideOr2~1_combout\,
	clrn => \sys_rst_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \seg_static|seg\(5));

-- Location: LCCOMB_X8_Y4_N22
\seg_static|WideOr3~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \seg_static|WideOr3~0_combout\ = (\seg_static|num\(1) & (!\seg_static|num\(3) & (\seg_static|num\(0)))) # (!\seg_static|num\(1) & ((\seg_static|num\(2) & (!\seg_static|num\(3))) # (!\seg_static|num\(2) & ((\seg_static|num\(0))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000101110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \seg_static|num\(3),
	datab => \seg_static|num\(1),
	datac => \seg_static|num\(0),
	datad => \seg_static|num\(2),
	combout => \seg_static|WideOr3~0_combout\);

-- Location: LCCOMB_X8_Y4_N28
\seg_static|WideOr3~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \seg_static|WideOr3~1_combout\ = (\seg_static|Equal1~0_combout\ & !\seg_static|WideOr3~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \seg_static|Equal1~0_combout\,
	datac => \seg_static|WideOr3~0_combout\,
	combout => \seg_static|WideOr3~1_combout\);

-- Location: FF_X8_Y4_N29
\seg_static|seg[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~inputclkctrl_outclk\,
	d => \seg_static|WideOr3~1_combout\,
	clrn => \sys_rst_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \seg_static|seg\(4));

-- Location: LCCOMB_X7_Y4_N4
\hc595_ctrl|Mux0~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \hc595_ctrl|Mux0~3_combout\ = (\hc595_ctrl|Mux0~2_combout\ & (((!\seg_static|seg\(4))) # (!\hc595_ctrl|cnt_bit\(1)))) # (!\hc595_ctrl|Mux0~2_combout\ & (\hc595_ctrl|cnt_bit\(1) & (!\seg_static|seg\(5))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010011010101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \hc595_ctrl|Mux0~2_combout\,
	datab => \hc595_ctrl|cnt_bit\(1),
	datac => \seg_static|seg\(5),
	datad => \seg_static|seg\(4),
	combout => \hc595_ctrl|Mux0~3_combout\);

-- Location: LCCOMB_X8_Y4_N12
\seg_static|WideOr7~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \seg_static|WideOr7~0_combout\ = (\seg_static|num\(3) & (\seg_static|num\(0) & (\seg_static|num\(1) $ (\seg_static|num\(2))))) # (!\seg_static|num\(3) & (!\seg_static|num\(1) & (\seg_static|num\(0) $ (\seg_static|num\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000110010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \seg_static|num\(3),
	datab => \seg_static|num\(1),
	datac => \seg_static|num\(0),
	datad => \seg_static|num\(2),
	combout => \seg_static|WideOr7~0_combout\);

-- Location: LCCOMB_X7_Y4_N22
\seg_static|WideOr7~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \seg_static|WideOr7~1_combout\ = (\seg_static|Equal1~0_combout\ & !\seg_static|WideOr7~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \seg_static|Equal1~0_combout\,
	datac => \seg_static|WideOr7~0_combout\,
	combout => \seg_static|WideOr7~1_combout\);

-- Location: FF_X7_Y4_N23
\seg_static|seg[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~inputclkctrl_outclk\,
	d => \seg_static|WideOr7~1_combout\,
	clrn => \sys_rst_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \seg_static|seg\(0));

-- Location: LCCOMB_X8_Y4_N24
\seg_static|WideOr6~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \seg_static|WideOr6~0_combout\ = (\seg_static|num\(3) & ((\seg_static|num\(0) & (\seg_static|num\(1))) # (!\seg_static|num\(0) & ((\seg_static|num\(2)))))) # (!\seg_static|num\(3) & (\seg_static|num\(2) & (\seg_static|num\(1) $ (\seg_static|num\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001111010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \seg_static|num\(3),
	datab => \seg_static|num\(1),
	datac => \seg_static|num\(0),
	datad => \seg_static|num\(2),
	combout => \seg_static|WideOr6~0_combout\);

-- Location: LCCOMB_X8_Y4_N2
\seg_static|WideOr6~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \seg_static|WideOr6~1_combout\ = (\seg_static|Equal1~0_combout\ & !\seg_static|WideOr6~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \seg_static|Equal1~0_combout\,
	datad => \seg_static|WideOr6~0_combout\,
	combout => \seg_static|WideOr6~1_combout\);

-- Location: FF_X8_Y4_N3
\seg_static|seg[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~inputclkctrl_outclk\,
	d => \seg_static|WideOr6~1_combout\,
	clrn => \sys_rst_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \seg_static|seg\(1));

-- Location: LCCOMB_X7_Y4_N24
\hc595_ctrl|Mux0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \hc595_ctrl|Mux0~0_combout\ = (\hc595_ctrl|cnt_bit\(0) & (((\hc595_ctrl|cnt_bit\(1))))) # (!\hc595_ctrl|cnt_bit\(0) & ((\hc595_ctrl|cnt_bit\(1) & ((!\seg_static|seg\(1)))) # (!\hc595_ctrl|cnt_bit\(1) & (!\seg_static|seg\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000111110001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \seg_static|seg\(3),
	datab => \hc595_ctrl|cnt_bit\(0),
	datac => \hc595_ctrl|cnt_bit\(1),
	datad => \seg_static|seg\(1),
	combout => \hc595_ctrl|Mux0~0_combout\);

-- Location: LCCOMB_X7_Y4_N0
\hc595_ctrl|Mux0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \hc595_ctrl|Mux0~1_combout\ = (\hc595_ctrl|cnt_bit\(0) & ((\hc595_ctrl|Mux0~0_combout\ & ((!\seg_static|seg\(0)))) # (!\hc595_ctrl|Mux0~0_combout\ & (!\seg_static|seg\(2))))) # (!\hc595_ctrl|cnt_bit\(0) & (((\hc595_ctrl|Mux0~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011111101000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \seg_static|seg\(2),
	datab => \hc595_ctrl|cnt_bit\(0),
	datac => \seg_static|seg\(0),
	datad => \hc595_ctrl|Mux0~0_combout\,
	combout => \hc595_ctrl|Mux0~1_combout\);

-- Location: LCCOMB_X7_Y4_N14
\hc595_ctrl|ds~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \hc595_ctrl|ds~0_combout\ = (!\hc595_ctrl|cnt_bit\(3) & ((\hc595_ctrl|cnt_bit\(2) & ((\hc595_ctrl|Mux0~1_combout\))) # (!\hc595_ctrl|cnt_bit\(2) & (\hc595_ctrl|Mux0~3_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010000010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \hc595_ctrl|cnt_bit\(3),
	datab => \hc595_ctrl|cnt_bit\(2),
	datac => \hc595_ctrl|Mux0~3_combout\,
	datad => \hc595_ctrl|Mux0~1_combout\,
	combout => \hc595_ctrl|ds~0_combout\);

-- Location: LCCOMB_X7_Y4_N6
\hc595_ctrl|ds~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \hc595_ctrl|ds~1_combout\ = (\hc595_ctrl|cnt_4\(1) & (((\hc595_ctrl|ds~q\)))) # (!\hc595_ctrl|cnt_4\(1) & ((\hc595_ctrl|cnt_4\(0) & ((\hc595_ctrl|ds~q\))) # (!\hc595_ctrl|cnt_4\(0) & (\hc595_ctrl|ds~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \hc595_ctrl|cnt_4\(1),
	datab => \hc595_ctrl|ds~0_combout\,
	datac => \hc595_ctrl|ds~q\,
	datad => \hc595_ctrl|cnt_4\(0),
	combout => \hc595_ctrl|ds~1_combout\);

-- Location: FF_X7_Y4_N7
\hc595_ctrl|ds\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sys_clk~inputclkctrl_outclk\,
	d => \hc595_ctrl|ds~1_combout\,
	clrn => \sys_rst_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \hc595_ctrl|ds~q\);

ww_stcp <= \stcp~output_o\;

ww_shcp <= \shcp~output_o\;

ww_ds <= \ds~output_o\;

ww_oe <= \oe~output_o\;
END structure;


