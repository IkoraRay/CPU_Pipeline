LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_signed.all;

ENTITY MUX IS
	PORT(
		X,Y: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
		Z: OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
		S, Clock: STD_LOGIC
	);
END MUX;
				
ARCHITECTURE Behavior OF MUX IS

	-- Funcionamento básico do MUX, escolhendo uma das entradas como a saida conforme a chave passada

BEGIN
	PROCESS(Clock)
	BEGIN
		IF Clock'EVENT AND Clock = '1' THEN
			IF S = '0' THEN
				Z <= X;
			ELSE
				Z <= Y;
			END IF;
		END IF;
	END PROCESS;
	
END Behavior;					