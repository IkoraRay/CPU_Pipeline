LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_signed.all;

ENTITY CPU IS
	PORT (
		Clock, Resetn	:IN	STD_LOGIC
	);
END CPU;

ARCHITECTURE Behavior OF CPU IS 

	--Unidade de controle
	SIGNAL ALUOp		: 	STD_LOGIC_VECTOR(1 DOWNTO 0);
	SIGNAL MemWrite	:	STD_LOGIC;
	SIGNAL RegWrite	:	STD_LOGIC;
	SIGNAL RegDst		:	STD_LOGIC;
	SIGNAL PCWrite		:	STD_LOGIC;
	SIGNAL ALUSourceB	:	STD_LOGIC;
	SIGNAL MovCond		:	STD_LOGIC;
	SIGNAL Cin			:  STD_LOGIC;
	SIGNAL MemtoReg	:  STD_LOGIC;
	
	
	--PC
	SIGNAL Address    : 	STD_LOGIC_VECTOR(15 DOWNTO 0);
	
	-- Instruction Reg
	SIGNAL OPcode		:  STD_LOGIC_vECTOR(3 DOWNTO 0);
	SIGNAL Ri			:	STD_LOGIC_vECTOR(3 DOWNTO 0);
	SIGNAL Rj			:	STD_LOGIC_VECTOR(3 DOWNTO 0);
	SIGNAL Rk_ime		:	STD_LOGIC_VECTOR(3 DOWNTO 0);
	
	
	--CACHE
	SIGNAL instruction	:	STD_LOGIC_VECTOR(15 DOWNTO 0);
	SIGNAL data_mem 		:  STD_LOGIC_VECTOR(7 DOWNTO 0);
	
	--RegBank
	SIGNAL RegA	:	STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL RegB	:	STD_LOGIC_VECTOR(7 DOWNTO 0);
	
	--MUX1
	SIGNAL DataReg : STD_LOGIC_VECTOR(7 DOWNTO 0);
	
	--MUX2
	SIGNAL Operator2 : STD_LOGIC_VECTOR(7 DOWNTO 0);
	
	--ULA
	SIGNAL Result		:	STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL Overflow	:	STD_LOGIC;
	SIGNAL Cout 		:	STD_LOGIC;
	
	
	-- Todos os componentes necessarios da ula
	
	COMPONENT PC
		PORT (
			Address_out				 : 	OUT 	STD_LOGIC_VECTOR(15 DOWNTO 0);
			Clock, PCWrite,Resetn : 	IN 	STD_LOGIC
		);
	END COMPONENT PC;
	
	COMPONENT RegBank
		PORT (
			regwrite, Clock, Resetn: IN STD_LOGIC;
			S1: OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
			S2: OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
			N: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
			Rs: IN STD_LOGIC_VECTOR (3 DOWNTO 0);
			Rt: IN STD_LOGIC_VECTOR (3 DOWNTO 0);
			Rd: IN STD_LOGIC_VECTOR (3 DOWNTO 0)
		);
	END COMPONENT RegBank;
	
	COMPONENT ULA
		PORT (
			Cin, Clock  	:	IN  STD_LOGIC;
			X,Y  				:	IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
			S    				:	OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
			Op   				:	IN STD_LOGIC_VECTOR(1 DOWNTO 0);
			Cout,Overflow 	: 	OUT STD_LOGIC
		);
	END COMPONENT ULA;
	
	COMPONENT CACHE
		PORT (
			address_PC: IN STD_LOGIC_VECTOR (15 DOWNTO 0); 
			address_mem: IN STD_LOGIC_VECTOR(3 DOWNTO 0); 
			data_instruction :OUT STD_LOGIC_VECTOR (15 DOWNTO 0); 
			data_in: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
			data_out: OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
			MemWrite, Clock, MemtoReg: IN STD_LOGIC
		);
	END COMPONENT CACHE;
	
	COMPONENT MUX
		PORT (
			X,Y: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
			Z: OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
			S, Clock: STD_LOGIC
		);
	END COMPONENT MUX;
	
	COMPONENT MUX_EXT
		PORT(
		X: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
		Y: IN STD_LOGIC_VECTOR (3 DOWNTO 0);
		Z: OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
		S, Clock: STD_LOGIC
	);
	END COMPONENT MUX_EXT;
	
	COMPONENT Controle
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
	END COMPONENT Controle;
	
	COMPONENT Instruction_Reg
		PORT (
			Mem_in: IN STD_LOGIC_VECTOR(15 DOWNTO 0);
			OPCode, Ri, Rj, Rk: OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
			Clock, Mov_Cond: IN STD_LOGIC
		);
	END COMPONENT Instruction_Reg;
	
	
BEGIN	
	PC1: PC PORT MAP(Address, Clock, PCWrite, Resetn);
	
	CACHE1: CACHE PORT MAP(Address, Rk_ime, instruction, Result, data_mem, MemWrite, Clock, MemtoReg);
	
	IR1: Instruction_Reg PORT MAP(instruction, OPcode, Ri, Rj, Rk_ime, Clock, MovCond);
	
	UC1: Controle PORT MAP(OPCode, Resetn, Clock, ALUop, MemWrite, MemtoReg, RegWrite, RegDst, PCWrite, Cin, ALUSourceB, MovCond);
			
	MUX1: MUX PORT MAP(Result, data_mem, DataReg, RegDst, Clock);
	
	RB1: RegBank PORT MAP(RegWrite, Clock, Resetn, RegA, RegB, DataReg, Rj, Rk_ime, Ri);
	
	MUX2: MUX_EXT PORT MAP(RegB, Rk_ime, Operator2, ALUSourceB, Clock);
	
	ULA1: ULA PORT MAP(Cin, Clock, RegA, Operator2, Result, ALUop, Cout, Overflow);		
	
END Behavior;