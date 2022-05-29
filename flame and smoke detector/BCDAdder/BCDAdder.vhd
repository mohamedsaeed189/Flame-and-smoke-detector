LIBRARY IEEE;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE work.BCD_package.all;

ENTITY BCDAdder IS 
PORT (X,Y : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
      S0, S1: OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
		Led: OUT STD_LOGIC_VECTOR(3 DOWNTO 0));
END BCDAdder;

ARCHITECTURE Behavior OF BCDAdder IS
SIGNAL Cout: STD_LOGIC ;
SIGNAL Sum: STD_LOGIC_VECTOR(3 DOWNTO 0);
BEGIN
Led <= ('0' & X)+Y;
stageBCD: BCD PORT MAP(X,Y,Cout,Sum);
S1(0) <= '0' WHEN Cout ='0' ELSE '1';
S1(1) <= '0' ;
S1(2) <= '0' ;
S1(3) <= '0' WHEN Cout ='0' ELSE '1';
S1(4) <= '0' WHEN Cout ='0' ELSE '1';
S1(5) <= '0' WHEN Cout ='0' ELSE '1';
S1(6) <= '1' WHEN Cout ='0' ELSE '1' ;
WITH Sum SELECT 
	S0(0) <= '1' WHEN "0001",
	          '1' WHEN "0100",
	 	       '0' WHEN OTHERS;  
WITH Sum SELECT 
	S0(1) <= '1' WHEN "0101",
	          '1' WHEN "0110",
	 	       '0' WHEN OTHERS;
WITH Sum SELECT 
	S0(2) <= '1' WHEN "0010",
	 	       '0' WHEN OTHERS; 
WITH Sum SELECT 
	S0(3) <= '1' WHEN "0001",
	          '1' WHEN "0100",
             '1' WHEN "0111",
	 	       '0' WHEN OTHERS;
WITH Sum SELECT 
	S0(4) <= '0' WHEN "0000",
		       '0' WHEN "0010",
	          '0' WHEN "0110",
             '0' WHEN "1000",
	 	       '1' WHEN OTHERS;
WITH Sum SELECT 
	S0(5) <= '1' WHEN "0001",
		       '1' WHEN "0010",
	          '1' WHEN "0011",
             '1' WHEN "0111",
	 	       '0' WHEN OTHERS;
WITH Sum SELECT 
	S0(6) <= '1' WHEN "0000",
		       '1' WHEN "0001",
	          '1' WHEN "0111",
	 	       '0' WHEN OTHERS;
	 
END Behavior;