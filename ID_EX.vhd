LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY ID_EX IS
	PORT (
			D1	:IN STD_LOGIC_VECTOR(7 DOWNTO 0);
			D2	:IN STD_LOGIC_VECTOR(7 DOWNTO 0);
			UC :IN STD_LOGIC_VECTOR(3 DOWNTO 0);
			RegDst :IN STD_LOGIC_VECTOR(3 DOWNTO 0); 
			Resetn, Clock :IN STD_LOGIC;
			Q1	:OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
			Q2	:OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
			WB	:OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
			ALUOp : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
			Cin : OUT STD_LOGIC
			
			);
			END ID_EX ;
			
			ARCHITECTURE Behavior OF ID_EX IS
			BEGIN
				PROCESS (Resetn, Clock)
				BEGIN
					IF Resetn = '0'THEN
					Q1 <= "00000000";
					Q2 <= "00000000";
					WB <= "00000";
					ALUOp <= "00";
					Cin <= '0';
					ELSIF Clock'EVENT AND Clock = '0' THEN
					Q1 <= D1(7 DOWNTO 0);
					Q2 <= D2(7 DOWNTO 0);
					WB(3 DOWNTO 0) <= RegDst; 
					WB(4) <= UC(3);
					ALUOp <= UC(1 DOWNTO 0);
					Cin <= UC(2);
					END IF;
				END PROCESS;
			END Behavior;
			
			
			
					
			