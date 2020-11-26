LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY EX_WB IS
	PORT (
			D	:IN STD_LOGIC_VECTOR(7 DOWNTO 0);
			Resetn, Clock :IN STD_LOGIC;
			WB	:IN STD_LOGIC_VECTOR(4 DOWNTO 0);
			Q1	:OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
			RegDst: OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
			Regwrite: OUT STD_LOGIC
			
			);
			END EX_WB ;
			
			ARCHITECTURE Behavior OF EX_WB IS
			BEGIN
				PROCESS (Resetn, Clock)
				BEGIN
					IF Resetn = '0'THEN
					Q1 <= "00000000";
					RegDst <= "0000";
					RegWrite <= '0';
					ELSIF Clock'EVENT AND Clock = '1' THEN
					Q1 <= D(7 DOWNTO 0);
					RegDst <= WB(3 DOWNTO 0);
					RegWrite <= WB(4);
					

			
					END IF;
				END PROCESS;
			END Behavior;
			
			
			