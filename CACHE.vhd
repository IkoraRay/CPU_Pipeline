LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY CACHE IS
	PORT (
		address_PC: IN STD_LOGIC_VECTOR (15 DOWNTO 0);
		data_instruction :OUT STD_LOGIC_VECTOR (15 DOWNTO 0); 
		Clock: IN STD_LOGIC
	);
END CACHE;
	
ARCHITECTURE Behavior OF CACHE IS

	-- Memoria contendo as instruções a serem executadas
	-- O vetor de instruções é acessado conforme o valor do componente PC

	TYPE instruction_array IS ARRAY (0 TO 11) of STD_LOGIC_VECTOR (15 DOWNTO 0);
	
	SIGNAL int_address: INTEGER RANGE 0 TO 11;
	
			
	CONSTANT instruction : instruction_array:= ("1001000100000111", "1000001000000010", "0001001100010000" ,"0010010000010010", "1010001100110011", 
															  "0011001000010100", "1011000100110000", "0100010001000000", "1100001100110111",
															  "1100000100100111", "1100000100100111",  "1101000000100001");
			
	
			
BEGIN
	
	int_address <= to_integer(signed(address_PC));

	PROCESS (Clock)
	BEGIN
		IF Clock = '0' THEN
						 
				data_instruction <= instruction(int_address);
				
			END IF;
	END PROCESS;
	
END Behavior;