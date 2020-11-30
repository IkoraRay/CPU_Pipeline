LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_signed.all;


ENTITY RegBank IS
	PORT(
		regwrite, Clock, Resetn: IN STD_LOGIC;
		S1: OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
		S2: OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
		N: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
		Rs: IN STD_LOGIC_VECTOR (3 DOWNTO 0);
		Rt: IN STD_LOGIC_VECTOR (3 DOWNTO 0);
		Rd: IN STD_LOGIC_VECTOR (3 DOWNTO 0)
);
END RegBank;
	
ARCHITECTURE Behavior OF RegBank IS
	--	O banco de registradores tem um total de cinco, sendo um deles constante e são zerados inicialmente pelo reset
	-- Quando o sinal regwrite for 1, o conteudor recebido (calculo da ula) armazena no registrador apontado pelo endereço RD
	-- Senao, é realizado a leitura dos registradores apontados por RS e RT

	SIGNAL R0: STD_LOGIC_VECTOR(7 DOWNTO 0); -- Constante 0
	SIGNAL R1: STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL R2: STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL R3: STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL R4: STD_LOGIC_VECTOR(7 DOWNTO 0);
		
BEGIN		
	PROCESS (Resetn, Clock)
		BEGIN
			IF Resetn = '0'THEN
				R0 <= "00000000";
				R1 <= "00000000";
				R2 <= "00000000";
				R3 <= "00000000";
				R4 <= "00000000";
			
			ELSIF Clock'EVENT AND Clock = '1' THEN
				IF regwrite = '1' THEN
					CASE Rd IS
						WHEN "0000" =>  R0 <= "00000000";
						WHEN "0001" =>  R1 <= N;	
						WHEN "0010" =>  R2 <= N;						
						WHEN "0011" =>  R3 <= N;
						WHEN OTHERS =>  R4 <= N;						
					END CASE;
						
				ELSIF regwrite = '0' THEN
						CASE Rs IS	 
						 WHEN "0000" => S1 <= R0;
						 WHEN "0001" => S1 <= R1;
						 WHEN "0010" => S1 <= R2;
						 WHEN "0011" =>  S1 <= R3;
						 WHEN OTHERS => S1 <= R4;
						END CASE;
						CASE Rt IS		
						WHEN "0000" => S2 <= R0;
						 WHEN "0001" => S2 <= R1;
						 WHEN "0010" => S2 <= R2;
						 WHEN "0011" =>  S2 <= R3;
						 WHEN OTHERS => S2 <= R4;
						END CASE;
						
				END IF;
			END IF;
	END PROCESS;
END Behavior;