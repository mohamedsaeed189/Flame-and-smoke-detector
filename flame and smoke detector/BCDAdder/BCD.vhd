LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
ENTITY BCD IS
PORT ( X, Y:IN STD_LOGIC_VECTOR(2 DOWNTO 0);
	Cout : OUT STD_LOGIC;
	S : OUT STD_LOGIC_VECTOR(3 DOWNTO 0) ) ;
END BCD;

ARCHITECTURE Behavior OF BCD IS
SIGNAL Z : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL Adjust : STD_LOGIC;
BEGIN
z <= ('0'& X) + Y ;
Adjust<='1' WHEN Z > 9 ELSE '0';
S <= Z WHEN (Adjust ='0')
 ELSE Z + 6 ;
Cout <= Adjust;
END Behavior;

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;

PACKAGE BCD_package IS
	Component BCD IS
PORT ( X, Y:IN STD_LOGIC_VECTOR(2 DOWNTO 0);
	Cout : OUT STD_LOGIC;
	S : OUT STD_LOGIC_VECTOR(3 DOWNTO 0) ) ;
END Component;
END BCD_package;