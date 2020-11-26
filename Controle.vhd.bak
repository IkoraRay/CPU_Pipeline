LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_signed.all;

ENTITY Controle IS
	PORT (
		instruction		:IN 	STD_LOGIC_VECTOR(3 DOWNTO 0);
		Resetn, Clock		:IN STD_LOGIC;
		
		ALUOp		: OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
		MemWrite		: OUT	STD_LOGIC;
		MemtoReg		: OUT STD_LOGIC;
		RegWrite		: OUT STD_LOGIC;
		RegDst		: OUT STD_LOGIC;
		PCWrite		: OUT STD_LOGIC;
		Cin         : OUT STD_LOGIC;
		ALUSourceB  : OUT STD_LOGIC;
		Mov_Cond		: OUT STD_LOGIC
		
	);
END Controle;

ARCHITECTURE Behavior Of Controle IS
		SIGNAL States: STD_LOGIC_VECTOR(3 DOWNTO 0);
		
		-- Unidade de controle alterna entre os estados conforme o andamento da execução da instrução
		-- Realizando Fetch, Decode, Tipo R (primeira etapa), Tipo I (primeira Etapa, Tipo R/I (Segunda etapa), Tipo R/I(Terceira etapa)
		-- Sinais de controle são emitidos conforme o estado na qual a unidade de controle se encontra
		-- Estado é resetado pelo sinal reset ou quando chega em um estado final da operação ou quando é um estado invalido (WHEN OTHERS)
		-- PCWrite gerado apenas no ultimo estado para obter a proxima instrução (Instrução atual concluida)
		
BEGIN
	PROCESS(Clock)
	BEGIN
		IF Clock'EVENT AND Clock = '1' THEN
			IF Resetn = '0' THEN
				States <= "0000";
			END IF;
			
					
				WHEN "0001" => --Decode
					PCWrite <= '0';
					IF instruction = "0000" THEN
						ALUOp <= "00";
						MemWrite <= '0';
						MemtoReg <= '0';
						RegWrite	<= '0';
						RegDst <= '0';
						PCWrite <= '0';
						Cin <= '0';
						ALUSourceB <= '0';
						Mov_Cond <= '1';
						States <= "0010";
					
					ELSIF instruction = "1000" THEN
						ALUOp <= "00";
						MemWrite <= '0';
						MemtoReg <= '0';
						RegWrite	<= '0';
						RegDst <= '0';
						PCWrite <= '0';
						Cin <= '0';
						ALUSourceB <= '0';
						Mov_Cond <= '1';
						States <= "0100";
					
					ELSIF instruction = "0001" THEN
						ALUOp <= "00";
						MemWrite <= '0';
						MemtoReg <= '0';
						RegWrite	<= '0';
						RegDst <= '0';
						PCWrite <= '0';
						Cin <= '0';
						ALUSourceB <= '0';
						Mov_Cond <= '0';
						States <= "0010";
						
					ELSIF instruction = "1001"THEN
						ALUOp <= "00";
						MemWrite <= '0';
						MemtoReg <= '0';
						RegWrite	<= '0';
						RegDst <= '0';
						PCWrite <= '0';
						Cin <= '0';
						ALUSourceB <= '0';
						Mov_Cond <= '0';
						States <= "0100";
						
					ELSIF instruction = "0010" THEN
						ALUOp <= "00";
						MemWrite <= '0';
						MemtoReg <= '0';
						RegWrite	<= '0';
						RegDst <= '0';
						PCWrite <= '0';
						Cin <= '0';
						ALUSourceB <= '0';
						Mov_Cond <= '0';
						States <= "0010";
					
					ELSIF instruction = "1010" THEN
						ALUOp <= "00";
						MemWrite <= '0';
						MemtoReg <= '0';
						RegWrite	<= '0';
						RegDst <= '0';
						PCWrite <= '0';
						Cin <= '0';
						ALUSourceB <= '0';
						Mov_Cond <= '0';
						States <= "0100";
					
					ELSIF instruction = "0011" THEN
						ALUOp <= "00";
						MemWrite <= '0';
						MemtoReg <= '0';
						RegWrite	<= '0';
						RegDst <= '0';
						PCWrite <= '0';
						Cin <= '0';
						ALUSourceB <= '0';
						Mov_Cond <= '0';
						States <= "0010";
						
					ELSIF instruction = "1011" THEN
						ALUOp <= "00";
						MemWrite <= '0';
						MemtoReg <= '0';
						RegWrite	<= '0';
						RegDst <= '0';
						PCWrite <= '0';
						Cin <= '0';
						ALUSourceB <= '0';
						Mov_Cond <= '0';
						States <= "0100";
						
					ELSIF instruction = "0100" THEN
						ALUOp <= "00";
						MemWrite <= '0';
						MemtoReg <= '0';
						RegWrite	<= '0';
						RegDst <= '0';
						PCWrite <= '0';
						Cin <= '0';
						ALUSourceB <= '0';
						Mov_Cond <= '0';
						States <= "0010";
						
					ELSIF	instruction = "1100" THEN
						ALUOp <= "00";
						MemWrite <= '0';
						MemtoReg <= '0';
						RegWrite	<= '0';
						RegDst <= '0';
						PCWrite <= '0';
						Cin <= '0';
						ALUSourceB <= '0';
						Mov_Cond <= '0';
						States <= "0100";
					
					ELSIF instruction = "1101" THEN
						ALUOp <= "00";
						MemWrite <= '0';
						MemtoReg <= '0';
						RegWrite	<= '0';
						RegDst <= '0';
						PCWrite <= '0';
						Cin <= '0';
						ALUSourceB <= '0';
						Mov_Cond <= '0';
						States <= "0110";
						
					ELSIF instruction = "1110" THEN -- Registradores Rs inutil
						ALUOp <= "00";
						MemWrite <= '0';
						MemtoReg <= '0';
						RegWrite	<= '0';
						RegDst <= '0';
						PCWrite <= '0';
						Cin <= '0';
						ALUSourceB <= '0';
						Mov_Cond <= '1';
						States <= "1001";
						
				
						
					END IF;
					
			
				
			END CASE;
		END IF;
	END PROCESS;
END Behavior;