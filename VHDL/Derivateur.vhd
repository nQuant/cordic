library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity derivateur is
	port
	(
	clk : in std_logic;
	phase : in std_logic_vector(15 downto 0);
	sigDerive: out std_logic_vector(15 downto 0):= (others => '0')
	);
end entity;

architecture derivateur_arc of derivateur is

-- {ALTERA_COMPONENTS_BEGIN} DO NOT REMOVE THIS LINE!
	signal phaseM1 : signed(15 downto 0) := (others => '0');
-- {ALTERA_COMPONENTS_END} DO NOT REMOVE THIS LINE!

begin
-- {ALTERA_INSTANTIATION_BEGIN} DO NOT REMOVE THIS LINE!
	process (clk)	
	begin
		if rising_edge(clk) then
			sigDerive <= std_logic_vector(signed(phase)-phaseM1);
			phaseM1 <= signed(phase);
		end if;
	end process;

-- {ALTERA_INSTANTIATION_END} DO NOT REMOVE THIS LINE!
end;