LIBRARY IEEE;
USE ieee.std_logic_1164.all;
ENTITY testtesttest IS
PORT ( fireSensor,smokeSensor : IN STD_LOGIC;
	    display, buzzer	: OUT STD_LOGIC);
END testtesttest;

ARCHITECTURE arch of testtesttest IS

BEGIN	
		buzzer <= ( not fireSensor) OR (NOT smokeSensor);
		display <= (not fireSensor) OR (NOT smokeSensor);	
END arch;

