LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_signed.all;

ENTITY IF_ID IS
	PORT (
			Mem_in: IN STD_LOGIC_VECTOR(15 DOWNTO 0);
			Ri, Rj, Rk: OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
			OpCode: OUT STD_LOGIC_VECTOR (2 DOWNTO 0);
			Ime: OUT STD_LOGIC;
			Clock: IN STD_LOGIC
			);
	END IF_ID;
	
ARCHITECTURE Behavior OF IF_ID IS

	-- Instrução a ser executada (lida na memoria) é recebida para ser fragmentada em varios sinais
	-- Opcode e os registradores/imediato a serem manuseados pela instrução
	-- Se for MOV, um dos registradores é o R0 (constante 0)

	BEGIN
			PROCESS(Clock)
			BEGIN
					IF Clock'EVENT AND Clock = '1' THEN
						
						Ime <= Mem_in(15);
						OPCode <= Mem_in(14 DOWNTO 12);
						Ri <= Mem_in(11 DOWNTO 8);
						Rj <= Mem_in(7 DOWNTO 4);
						Rk <= Mem_in(3 DOWNTO 0);
					
				END IF;
			END PROCESS;
	END Behavior;
						
			