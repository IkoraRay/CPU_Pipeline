LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY CACHE IS
	PORT (
		address_PC: IN STD_LOGIC_VECTOR (15 DOWNTO 0);
		address_mem: IN STD_LOGIC_VECTOR(3 DOWNTO 0); 
		data_instruction :OUT STD_LOGIC_VECTOR (15 DOWNTO 0); 
		data_in: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
		data_out: OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
		MemWrite, Clock, MemtoReg: IN STD_LOGIC
	);
END CACHE;
	
ARCHITECTURE Behavior OF CACHE IS

	-- Memoria contendo as instruções a serem executadas
	-- O vetor de instruções é acessado conforme o valor do componente PC
	-- Memoria tambem possui regiões para escrita e leitura de dados
	-- Se sinal MemWrite for 1, é realizado uma escrita de dados
	-- Se sinal MemToReg é realizado uma leitura de dados
	-- Senão, é lida a instrução apontada por PC

	TYPE instruction_array IS ARRAY (0 TO 11) of STD_LOGIC_VECTOR (15 DOWNTO 0);
	TYPE data_array is ARRAY (0 TO 11) of STD_LOGIC_VECTOR (7 DOWNTO 0);
	SIGNAL int_address: INTEGER RANGE 0 TO 11;
	SIGNAL data_address: INTEGER RANGE 0 TO 15;
			
	CONSTANT instruction : instruction_array:= ("1000000100010111", "0000001000010001", "1110010000000000" ,"1001001100100001", "1001001000100111", 
															  "0010001100110001", "1010001100110111", "0011010000110000", "1011001100010111",
															  "0100001001000011", "1100000100100111",  "1101000000100001");
			
	SHARED VARIABLE data: data_array:= ("00000111","00000000","00000000","00000000",
										  "00000000","00000000","00000000","00000000",
										  "00000000","00000000","00000000","00000000");
			
BEGIN
	
	int_address <= to_integer(signed(address_PC));
	data_address <= to_integer(signed(address_mem));
	
	
	PROCESS (Clock)
	BEGIN
		IF Clock'EVENT AND Clock = '1' THEN
			IF MemtoReg = '1' THEN
				data_out <= data(data_address);
					
			ELSIF MemWrite = '1' THEN 
				data(data_address) := data_in;
				
			ELSE 
				data_instruction <= instruction(int_address);
				
			END IF;
		END IF;
	END PROCESS;
	
END Behavior;