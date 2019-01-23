-- Copyright (C) 2018  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details.

library ieee;
use ieee.std_logic_1164.all;
library altera;
use altera.altera_syn_attributes.all;

entity DemodulateurFM is
	port
	(
-- {ALTERA_IO_BEGIN} DO NOT REMOVE THIS LINE!

		CLOCK2_50 : in std_logic;
		CLOCK3_50 : in std_logic;
		CLOCK4_50 : in std_logic;
		CLOCK_50 : in std_logic;
--		DRAM_CAS_N : in std_logic;
--		DRAM_CKE : in std_logic;
--		DRAM_CLK : in std_logic;
--		DRAM_CS_N : in std_logic;
--		DRAM_LDQM : in std_logic;
--		DRAM_RAS_N : in std_logic;
--		DRAM_UDQM : in std_logic;
--		DRAM_WE_N : in std_logic;
--		IRDA_RXD : in std_logic;
--		IRDA_TXD : in std_logic;
--		DRAM_ADDR : in std_logic_vector(0 to 12);
--		DRAM_BA : in std_logic_vector(0 to 1);
--		DRAM_DQ : in std_logic_vector(0 to 15);
		HEX0 : in std_logic_vector(0 to 6);
		HEX1 : in std_logic_vector(0 to 6);
		HEX2 : in std_logic_vector(0 to 6);
		HEX3 : in std_logic_vector(0 to 6);
		HEX4 : in std_logic_vector(0 to 6);
		HEX5 : in std_logic_vector(0 to 6);
		KEY : in std_logic_vector(0 to 3);
		LEDR : in std_logic_vector(0 to 9);
		SW : in std_logic_vector(0 to 9);
		QIn: in std_logic_vector(15 downto 0);
		IIn: in std_logic_vector(15 downto 0);
		xsi : out std_logic_vector(13 downto 0);
		Phase: out std_logic_vector(13 downto 0):=(others=>'0');
		SigOut: out std_logic_vector(15 downto 0):=(others=>'0')
-- {ALTERA_IO_END} DO NOT REMOVE THIS LINE!

	);

-- {ALTERA_ATTRIBUTE_BEGIN} DO NOT REMOVE THIS LINE!
-- {ALTERA_ATTRIBUTE_END} DO NOT REMOVE THIS LINE!
end DemodulateurFM;

architecture ppl_type of DemodulateurFM is

-- {ALTERA_COMPONENTS_BEGIN} DO NOT REMOVE THIS LINE!
	component cordic_atand
		port
		(
		clk : in std_logic;
		Q : in std_logic_vector(15 downto 0);
		I : in std_logic_vector(15 downto 0);
		xsi : out std_logic_vector(13 downto 0);
		angle : out std_logic_vector(15 downto 0)
		);
	end component;
	
	component derivateur
		port
		(
		clk : in std_logic;
		phase: in std_logic_vector(15 downto 0);
		sigDerive: out std_logic_vector(15 downto 0)
		);
	end component;
	signal sigPhase: std_logic_vector(15 downto 0);
	
-- {ALTERA_COMPONENTS_END} DO NOT REMOVE THIS LINE!
begin
-- {ALTERA_INSTANTIATION_BEGIN} DO NOT REMOVE THIS LINE!
	inst0: cordic_atand port map(clk=>CLOCK_50, Q=>QIn,I=>IIn,xsi=>xsi,angle=>sigPhase);
	inst1: derivateur port map(clk=>CLOCK_50,phase=>sigPhase,sigDerive=>SigOut);
-- {ALTERA_INSTANTIATION_END} DO NOT REMOVE THIS LINE!

end;
