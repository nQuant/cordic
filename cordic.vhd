library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity cordic is
	port
	(
	clk : in std_logic;
	Q : in std_logic_vector(15 downto 0);
	I : in std_logic_vector(15 downto 0);
	xsi : out std_logic_vector(13 downto 0);
	angle : out std_logic_vector(15 downto 0)
	);
end entity;

architecture cordic_arc of cordic is

-- {ALTERA_COMPONENTS_BEGIN} DO NOT REMOVE THIS LINE!
	signal Q1_0 : signed(15 downto 0):="0010000000000000";
	signal Q2_0 : signed(15 downto 0):="0010000000000000";
	signal Q1_1 : signed(15 downto 0):="0010000000000000";
	signal Q2_1 : signed(15 downto 0):="0010000000000000";
	signal Q1_2 : signed(15 downto 0):="0010000000000000";
	signal Q2_2 : signed(15 downto 0):="0010000000000000";
	signal Q1_3 : signed(15 downto 0):="0010000000000000";
	signal Q2_3 : signed(15 downto 0):="0010000000000000";
	signal Q1_4 : signed(15 downto 0):="0010000000000000";
	signal Q2_4 : signed(15 downto 0):="0010000000000000";
	signal Q1_5 : signed(15 downto 0):="0010000000000000";
	signal Q2_5 : signed(15 downto 0):="0010000000000000";
	signal Q1_6 : signed(15 downto 0):="0010000000000000";
	signal Q2_6 : signed(15 downto 0):="0010000000000000";
	signal Q1_7 : signed(15 downto 0):="0010000000000000";
	signal Q2_7 : signed(15 downto 0):="0010000000000000";
	signal Q1_8 : signed(15 downto 0):="0010000000000000";
	signal Q2_8 : signed(15 downto 0):="0010000000000000";
	signal Q1_9 : signed(15 downto 0):="0010000000000000";
	signal Q2_9 : signed(15 downto 0):="0010000000000000";
	signal Q1_10 : signed(15 downto 0):="0010000000000000";
	signal Q2_10 : signed(15 downto 0):="0010000000000000";
	signal Q1_11 : signed(15 downto 0):="0010000000000000";
	signal Q2_11 : signed(15 downto 0):="0010000000000000";
	signal Q1_12 : signed(15 downto 0):="0010000000000000";
	signal Q2_12 : signed(15 downto 0):="0010000000000000";
	signal Q1_13 : signed(15 downto 0):="0010000000000000";
	signal Q2_13 : signed(15 downto 0):="0010000000000000";
	signal sigQ0 : signed(15 downto 0):="0010000000000000";
	signal sigI0 : signed(15 downto 0):="0010000000000000";
	signal sigQ1 : signed(15 downto 0):="0010000000000000";
	signal sigI1 : signed(15 downto 0):="0010000000000000";
	signal sigQ2 : signed(15 downto 0):="0010000000000000";
	signal sigI2 : signed(15 downto 0):="0010000000000000";
	signal sigQ3 : signed(15 downto 0):="0010000000000000";
	signal sigI3 : signed(15 downto 0):="0010000000000000";
	signal sigQ4 : signed(15 downto 0):="0010000000000000";
	signal sigI4 : signed(15 downto 0):="0010000000000000";
	signal sigQ5 : signed(15 downto 0):="0010000000000000";
	signal sigI5 : signed(15 downto 0):="0010000000000000";
	signal sigQ6 : signed(15 downto 0):="0010000000000000";
	signal sigI6 : signed(15 downto 0):="0010000000000000";
	signal sigQ7 : signed(15 downto 0):="0010000000000000";
	signal sigI7 : signed(15 downto 0):="0010000000000000";
	signal sigQ8 : signed(15 downto 0):="0010000000000000";
	signal sigI8 : signed(15 downto 0):="0010000000000000";
	signal sigQ9 : signed(15 downto 0):="0010000000000000";
	signal sigI9 : signed(15 downto 0):="0010000000000000";
	signal sigQ10 : signed(15 downto 0):="0010000000000000";
	signal sigI10 : signed(15 downto 0):="0010000000000000";
	signal sigQ11 : signed(15 downto 0):="0010000000000000";
	signal sigI11 : signed(15 downto 0):="0010000000000000";
	signal sigQ12 : signed(15 downto 0):="0010000000000000";
	signal sigI12 : signed(15 downto 0):="0010000000000000";
	signal sigQ13 : signed(15 downto 0):="0010000000000000";
	signal sigI13 : signed(15 downto 0):="0010000000000000";
	signal sigOut0 : std_logic :='0';
	signal sigOut1 : std_logic_vector(1 downto 0):=(others=>'0');
	signal sigOut2 : std_logic_vector(2 downto 0):=(others=>'0');
	signal sigOut3 : std_logic_vector(3 downto 0):=(others=>'0');
	signal sigOut4 : std_logic_vector(4 downto 0):=(others=>'0');
	signal sigOut5 : std_logic_vector(5 downto 0):=(others=>'0');
	signal sigOut6 : std_logic_vector(6 downto 0):=(others=>'0');
	signal sigOut7 : std_logic_vector(7 downto 0):=(others=>'0');
	signal sigOut8 : std_logic_vector(8 downto 0):=(others=>'0');
	signal sigOut9 : std_logic_vector(9 downto 0):=(others=>'0');
	signal sigOut10 : std_logic_vector(10 downto 0):=(others=>'0');
	signal sigOut11 : std_logic_vector(11 downto 0):=(others=>'0');
	signal sigOut12 : std_logic_vector(12 downto 0):=(others=>'0');
	signal sigOut13 : std_logic_vector(13 downto 0):=(others=>'0');
	signal angle0 : signed(15 downto 0):=(others=>'0');
	signal angle1 : signed(15 downto 0):=(others=>'0');
	signal angle2 : signed(15 downto 0):=(others=>'0');
	signal angle3 : signed(15 downto 0):=(others=>'0');
	signal angle4 : signed(15 downto 0):=(others=>'0');
	signal angle5 : signed(15 downto 0):=(others=>'0');
	signal angle6 : signed(15 downto 0):=(others=>'0');
	signal angle7 : signed(15 downto 0):=(others=>'0');
	signal angle8 : signed(15 downto 0):=(others=>'0');
	signal angle9 : signed(15 downto 0):=(others=>'0');
	signal angle10 : signed(15 downto 0):=(others=>'0');
	signal angle11 : signed(15 downto 0):=(others=>'0');
	signal angle12 : signed(15 downto 0):=(others=>'0');
	signal angle13 : signed(15 downto 0):=(others=>'0');
	signal angles0 : signed(15 downto 0):="0101101000000000";
	signal angles1 : signed(15 downto 0):="0010110100000000";
	signal angles2 : signed(15 downto 0):="0001101010010000";
	signal angles3 : signed(15 downto 0):="0000111000001001";
	signal angles4 : signed(15 downto 0):="0000011100100000";
	signal angles5 : signed(15 downto 0):="0000001110010011";
	signal angles6 : signed(15 downto 0):="0000000111001010";
	signal angles7 : signed(15 downto 0):="0000000011100101";
	signal angles8 : signed(15 downto 0):="0000000001110010";
	signal angles9 : signed(15 downto 0):="0000000000111001";
	signal angles10 : signed(15 downto 0):="0000000000011100";
	signal angles11 : signed(15 downto 0):="0000000000001110";
	signal angles12 : signed(15 downto 0):="0000000000000111";
	signal angles13 : signed(15 downto 0):="0000000000000011";
	
	
-- {ALTERA_COMPONENTS_END} DO NOT REMOVE THIS LINE!

begin
-- {ALTERA_INSTANTIATION_BEGIN} DO NOT REMOVE THIS LINE!
	cordic : process (clk)	
	begin
		if rising_edge(clk) then
			
			if signed(Q)>=0 then
				sigQ0<=-signed(I);
				sigI0<=signed(Q);
				sigOut0<='1';
				angle0<=angles0;
			else
				sigQ0<=signed(I);
				sigI0<=-signed(Q);
				sigOut0<='0';
				angle0<=-angles0;
			end if;
			
			Q1_0<=sigQ0+shift_right(sigI0,0);
			Q2_0<=sigQ0-shift_right(sigI0,0);
			sigOut1(1)<=sigOut0;
			
			if abs(Q1_0)<abs(Q2_0) then
				sigQ1<=Q1_0;
				sigI1<=sigI0-shift_right(sigQ0,0);
				sigOut1(0)<='1';
				angle1<=angle0+angles1;
			else
				sigQ1<=Q2_0;
				sigI1<=sigI0+shift_right(sigQ0,0);
				sigOut1(0)<='0';
				angle1<=angle0-angles1;
			end if;
			
			Q1_1<=sigQ1+shift_right(sigI1,1);
			Q2_1<=sigQ1-shift_right(sigI1,1);
			sigOut2(2 downto 1)<=sigOut1(1 downto 0);
			
			if abs(Q1_1)<abs(Q2_1) then
				sigQ2<=Q1_1;
				sigI2<=sigI1-shift_right(sigQ1,1);
				sigOut2(0)<='1';
				angle2<=angle1+angles2;
			else
				sigQ2<=Q2_1;
				sigI2<=sigI1+shift_right(sigQ1,1);
				sigOut2(0)<='0';
				angle2<=angle1-angles2;
			end if;
			
			Q1_2<=sigQ2+shift_right(sigI2,2);
			Q2_2<=sigQ2-shift_right(sigI2,2);
			sigOut3(3 downto 1)<=sigOut2(2 downto 0);
			
			if abs(Q1_2)<abs(Q2_2) then
				sigQ3<=Q1_2;
				sigI3<=sigI2-shift_right(sigQ2,2);
				sigOut3(0)<='1';
				angle3<=angle2+angles3;
			else
				sigQ3<=Q2_2;
				sigI3<=sigI2+shift_right(sigQ2,2);
				sigOut3(0)<='0';
				angle3<=angle2-angles3;
			end if;
			
			Q1_3<=sigQ3+shift_right(sigI3,3);
			Q2_3<=sigQ3-shift_right(sigI3,3);
			sigOut4(4 downto 1)<=sigOut3(3 downto 0);
			
			if abs(Q1_3)<abs(Q2_3) then
				sigQ4<=Q1_3;
				sigI4<=sigI3-shift_right(sigQ3,3);
				sigOut4(0)<='1';
				angle4<=angle3+angles4;
			else
				sigQ4<=Q2_3;
				sigI4<=sigI3+shift_right(sigQ3,3);
				sigOut4(0)<='0';
				angle4<=angle3-angles4;
			end if;
			
			Q1_4<=sigQ4+shift_right(sigI4,4);
			Q2_4<=sigQ4-shift_right(sigI4,4);
			sigOut5(5 downto 1)<=sigOut4(4 downto 0);
			
			if abs(Q1_4)<abs(2_4) then
				sigQ5<=Q1_4;
				sigI5<=sigI4-shift_right(sigQ4,4);
				sigOut5(0)<='1';
				angle5<=angle4+angles5;
			else
				sigQ5<=Q2_4;
				sigI5<=sigI4+shift_right(sigQ4,4);
				sigOut5(0)<='0';
				angle5<=angle4-angles5;
			end if;
			
			Q1_5<=sigQ5+shift_right(sigI5,5);
			Q2_5<=sigQ5-shift_right(sigI5,5);
			sigOut6(6 downto 1)<=sigOut5(5 downto 0);
			
			if abs(Q1_5)<abs(Q2_5) then
				sigQ6<=Q1_5;
				sigI6<=sigI5-shift_right(sigQ5,5);
				sigOut6(0)<='1';
				angle6<=angle5+angles6;
			else
				sigQ6<=Q2_5;
				sigI6<=sigI5+shift_right(sigQ5,5);
				sigOut6(0)<='0';
				angle6<=angle5-angles6;
			end if;
			
			Q1_6<=sigQ6+shift_right(sigI6,6);
			Q2_6<=sigQ6-shift_right(sigI6,6);
			sigOut7(7 downto 1)<=sigOut6(6 downto 0);
			
			if abs(Q1_6)<abs(Q2_6) then
				sigQ7<=Q1_6;
				sigI7<=sigI6-shift_right(sigQ6,6);
				sigOut7(0)<='1';
				angle7<=angle6+angles7;
			else
				sigQ7<=Q2_6;
				sigI7<=sigI6+shift_right(sigQ6,6);
				sigOut7(0)<='0';
				angle7<=angle6-angles7;
			end if;
			
			Q1_7<=sigQ7+shift_right(sigI7,7);
			Q2_7<=sigQ7-shift_right(sigI7,7);
			sigOut8(8 downto 1)<=sigOut7(7 downto 0);
			
			if abs(Q1_7)<abs(Q2_7) then
				sigQ8<=Q1_7;
				sigI8<=sigI7-shift_right(sigQ7,7);
				sigOut8(0)<='1';
				angle8<=angle7+angles8;
			else
				sigQ8<=Q2_7;
				sigI8<=sigI7+shift_right(sigQ7,7);
				sigOut8(0)<='0';
				angle8<=angle7-angles8;
			end if;
			
			Q1_8<=sigQ8+shift_right(sigI8,8);
			Q2_8<=sigQ8-shift_right(sigI8,8);
			sigOut9(9 downto 1)<=sigOut8(8 downto 0);
			
			if abs(Q1_8)<abs(Q2_8) then
				sigQ9<=Q1_8;
				sigI9<=sigI8-shift_right(sigQ8,8);
				sigOut9(0)<='1';
				angle9<=angle8+angles9;
			else
				sigQ9<=Q2_8;
				sigI9<=sigI8+shift_right(sigQ8,8);
				sigOut9(0)<='0';
				angle9<=angle8-angles9;
			end if;
			
			Q1_9<=sigQ9+shift_right(sigI9,9);
			Q2_9<=sigQ9-shift_right(sigI9,9);
			sigOut10(10 downto 1)<=sigOut9(9 downto 0);
			
			if abs(Q1_9)<abs(Q2_9) then
				sigQ10<=Q1_9;
				sigI10<=sigI9-shift_right(sigQ9,9);
				sigOut10(0)<='1';
				angle10<=angle9+angles10;
			else
				sigQ10<=Q2_9;
				sigI10<=sigI9+shift_right(sigQ9,9);
				sigOut10(0)<='0';
				angle10<=angle9+angles10;
			end if;
			
			Q1_10<=sigQ10+shift_right(sigI10,10);
			Q2_10<=sigQ10-shift_right(sigI10,10);
			sigOut11(11 downto 1)<=sigOut10(10 downto 0);
			
			if abs(Q1_10)<abs(Q2_10) then
				sigQ11<=Q1_10;
				sigI11<=sigI10-shift_right(sigQ10,10);
				sigOut11(0)<='1';
				angle11<=angle10+angles11;
			else
				sigQ11<=Q2_10;
				sigI11<=sigI10+shift_right(sigQ10,10);
				sigOut11(0)<='0';
				angle11<=angle10-angles11;
			end if;
			
			Q1_11<=sigQ11+shift_right(sigI11,11);
			Q2_11<=sigQ11-shift_right(sigI11,11);
			sigOut12(12 downto 1)<=sigOut11(11 downto 0);
			
			if abs(Q1_11)<abs(Q2_11) then
				sigQ12<=Q1_11;
				sigI12<=sigI11-shift_right(sigQ11,11);
				sigOut12(0)<='1';
				angle12<=angle11+angles12;
			else
				sigQ12<=Q2_11;
				sigI12<=sigI11+shift_right(sigQ11,11);
				sigOut12(0)<='0';
				angle12<=angle11-angles12;
			end if;
			
			Q1_12<=sigQ12+shift_right(sigI12,12);
			Q2_12<=sigQ12-shift_right(sigI12,12);
			sigOut13(13 downto 1)<=sigOut12(12 downto 0);
			
			if abs(Q1_12)<abs(Q2_12) then
				sigQ13<=Q1_12;
				sigI13<=sigI12-shift_right(sigQ12,12);
				sigOut13(0)<='1';
				angle13<=angle12+angles13;
			else
				sigQ13<=Q2_12;
				sigI13<=sigI12+shift_right(sigQ12,12);
				sigOut13(0)<='0';
				angle13<=angle12-angles13;
			end if;
			
			xsi<=sigOut13(13 downto 0);
			angle<=std_logic_vector(angle13);
		end if;
	end process;
	
-- {ALTERA_INSTANTIATION_END} DO NOT REMOVE THIS LINE!
end;
