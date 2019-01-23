library ieee;
use ieee.std_logic_1164.all;
library altera;
use altera.altera_syn_attributes.all;


entity test_demodulateurfm is

end test_demodulateurfm;

architecture arch of test_demodulateurfm is

-- {ALTERA_COMPONENTS_BEGIN} DO NOT REMOVE THIS LINE!
	procedure clk_gen(signal clk : out std_logic; constant FREQ : real) is
		constant PERIOD    : time := 1 sec / FREQ;        -- Full period
		constant HIGH_TIME : time := PERIOD / 2;          -- High time
		constant LOW_TIME  : time := PERIOD - HIGH_TIME;  -- Low time; always >= HIGH_TIME
		begin
			-- Check the arguments
			assert (HIGH_TIME /= 0 fs) report "clk_plain: High time is zero; time resolution to large for frequency" severity FAILURE;
			-- Generate a clock cycle
			loop
			clk <= '1';
			wait for HIGH_TIME;
			clk <= '0';
			wait for LOW_TIME;
			end loop;
	end procedure;

	component DemodulateurFM
		port
		(
		CLOCK2_50 : in std_logic:='0';
		CLOCK3_50 : in std_logic:='0';
		CLOCK4_50 : in std_logic:='0';
		CLOCK_50 : in std_logic:='0';
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
		HEX0 : in std_logic_vector(0 to 6):=(others=>'0');
		HEX1 : in std_logic_vector(0 to 6):=(others=>'0');
		HEX2 : in std_logic_vector(0 to 6):=(others=>'0');
		HEX3 : in std_logic_vector(0 to 6):=(others=>'0');
		HEX4 : in std_logic_vector(0 to 6):=(others=>'0');
		HEX5 : in std_logic_vector(0 to 6):=(others=>'0');
		KEY : in std_logic_vector(0 to 3):=(others=>'0');
		LEDR : in std_logic_vector(0 to 9):=(others=>'0');
		SW : in std_logic_vector(0 to 9):=(others=>'0');
		QIn: in std_logic_vector(15 downto 0);
		IIn: in std_logic_vector(15 downto 0);
		xsi : out std_logic_vector(13 downto 0);
		Phase: out std_logic_vector(13 downto 0):=(others=>'0');
		SigOut: out std_logic_vector(15 downto 0):=(others=>'0')
		);
	end component;
	signal clk_50 : std_logic;
	signal QIn: std_logic_vector(15 downto 0):="0100000000000000";
	signal IIn: std_logic_vector(15 downto 0):=(others=>'0');
-- {ALTERA_COMPONENTS_END} DO NOT REMOVE THIS LINE!
begin
-- {ALTERA_INSTANTIATION_BEGIN} DO NOT REMOVE THIS LINE!
	inst0: DemodulateurFM port map(CLOCK_50=>clk_50,QIn=>QIn,IIn=>IIn);
	clk_gen(clk_50, 50.0E6);
-- {ALTERA_INSTANTIATION_END} DO NOT REMOVE THIS LINE!
end architecture;