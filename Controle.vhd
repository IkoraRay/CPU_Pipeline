LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_signed.all;

ENTITY Controle IS
	PORT (
		instruction		:IN 	STD_LOGIC_VECTOR(2 DOWNTO 0);
		Resetn, Clock		:IN STD_LOGIC;
		RegDst			:IN 	STD_LOGIC_VECTOR(3 DOWNTO 0);
		UCOut: OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
		
	);
END Controle;

ARCHITECTURE Behavior Of Controle IS
		
		-- Unidade de controle alterna entre os estados conforme o andamento da execução da instrução
		-- Realizando Fetch, Decode, Tipo R (primeira etapa), Tipo I (primeira Etapa, Tipo R/I (Segunda etapa), Tipo R/I(Terceira etapa)
		-- Sinais de controle são emitidos conforme o estado na qual a unidade de controle se encontra
		-- Estado é resetado pelo sinal reset ou quando chega em um estado final da operação ou quando é um estado invalido (WHEN OTHERS)
		-- PCWrite gerado apenas no ultimo estado para obter a proxima instrução (Instrução atual concluida)
		SIGNAL ALUOp		 : STD_LOGIC_VECTOR(1 DOWNTO 0);
		SIGNAL Cin         : STD_LOGIC;
		SIGNAL RegWrite	 : STD_LOGIC;	
BEGIN
	PROCESS(Clock)
	BEGIN
		IF Resetn = '0' THEN
				UCOut <= "00000000";
		
			
		ELSIF Clock'EVENT AND Clock = '1' THEN
			
					IF instruction = "000" THEN
						ALUOp <= "00";
						RegWrite	<= '1';
						Cin <= '0';
		
					ELSIF instruction = "001" THEN
						ALUOp <= "00";
						RegWrite	<= '1';
						Cin <= '0';
	
					ELSIF instruction = "010" THEN
						ALUOp <= "01";
						RegWrite	<= '1';
						Cin <= '1';
	
					ELSIF instruction = "011" THEN
						ALUOp <= "10";
						RegWrite	<= '1';
						Cin <= '0';
	
					ELSIF instruction = "100" THEN
						ALUOp <= "11";
						RegWrite	<= '1';
						Cin <= '0';

					END IF;
					UCOut(1 DOWNTO 0) <= ALUOp;
					UCOut(2) <= Cin;
					Ucout(3) <= Regwrite;
					UCOut(7 DOWNTO 4) <= RegDst;

		END IF;
	END PROCESS;
END Behavior;