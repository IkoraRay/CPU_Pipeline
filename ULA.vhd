LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_signed.all;

ENTITY ULA IS
	PORT(
		Cin, Clock  				:	IN  STD_LOGIC;
		X,Y  				:	IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
		S    				:	OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
		Op   				:	IN STD_LOGIC_VECTOR(1 DOWNTO 0);
		Cout,Overflow 	: 	OUT STD_LOGIC
);
END ULA;
	 
ARCHITECTURE LogicFunc OF ULA IS

	-- As operações são feitas simultaneamente, na qual, a saida é determinada pelo sinal OP (ALUOp)

	SIGNAL Sum1: STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL Sum2: STD_LOGIC_VECTOR(8 DOWNTO 0);
	SIGNAL L1: STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL L2: STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL Sub: STD_LOGIC_VECTOR(7 DOWNTO 0);
	
BEGIN
	PROCESS( Clock)
	BEGIN
	IF Clock'EVENT AND Clock = '1' THEN
	Sum1 <=  X + Y + Cin;
	Sum2 <=  (X & '0') + Y + Cin;
	Sub <= X + (NOT Y) + 1 ;
	L1 <= X AND Y;
	L2 <= X OR Y;
	Cout <= Sum2(8);
	Overflow <= Sum2(8) XOR X(7) XOR Y(7) XOR Sum1(7);

	CASE Op IS
		 WHEN "00" =>  S <= Sum1;
		 WHEN "01" => 	S <= Sub;
		 WHEN "10" =>	S <= L1;
		 WHEN OTHERS =>S <= L2;
		 
		END CASE;		
		END IF;
	END PROCESS;
END LogicFunc;