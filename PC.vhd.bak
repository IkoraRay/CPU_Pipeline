LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_signed.all;

ENTITY PC IS
	PORT (
		Address_out				 : 	OUT 	STD_LOGIC_VECTOR(15 DOWNTO 0);
		Clock, PCWrite,Resetn : 	IN 	STD_LOGIC
	);
END PC;

ARCHITECTURE Behavior OF PC IS
		SIGNAL Address: STD_LOGIC_VECTOR(15 DOWNTO 0);
		SIGNAL Add: STD_LOGIC_VECTOR(15 DOWNTO 0);
		
		-- O Componente PC tem o funcionamento semelhante a um contador, resetando através do sinal reset para uma nova contagem
		-- A contagem é feita pela incrementação do sinal inicial, no caso 0

BEGIN
	
	Add <= "0000000000000001";
	PROCESS (Clock, PCWrite)
	BEGIN
		IF Clock'EVENT AND Clock = '1' THEN
			IF Resetn = '0'THEN
				Address <= "0000000000000000";
			END IF;
			IF PCWrite = '1' THEN 
				Address <= Address + Add;
				ELSE
				Address_out <= Address;
			END IF;
		END IF;
	END PROCESS;
END Behavior;				
			