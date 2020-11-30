LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_signed.all;

ENTITY MUX_EXT IS
	PORT(
		X: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
		Y: IN STD_LOGIC_VECTOR (3 DOWNTO 0);
		Z: OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
		S, Clock: STD_LOGIC
	);
END MUX_EXT;
				
ARCHITECTURE Behavior OF MUX_EXT IS
	SIGNAL sinal : STD_LOGIC;
	
	
	-- Semelhante a MUX, contudo, uma das entradas é o imediato
	-- O imediato por sua vez recebe o tratamento de extender o sinal antes de entrar na ULA
	-- O sinal é extendido conforme o bit mais significativo do imediato
	-- Imediato é um número sinalizado (portanto positivo ou negativo)
	
BEGIN
	PROCESS(Clock)
	BEGIN
		IF Clock'EVENT AND Clock = '1' THEN
			IF S = '0' THEN
				Z <= X;
			ELSE
				sinal <= Y(3);
				IF sinal = '0' THEN
				Z <= "0000" & Y;
			ELSE
				Z <= "1111" & Y; 
			END IF;
				
			END IF;
		END IF;
	END PROCESS;
	
END Behavior;					