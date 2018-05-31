----------------------------------------------------------------------------------
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity union is
    Port ( unrst : in  STD_LOGIC;      --rst
           unclk : in  STD_LOGIC;      --clk
           unout : out  STD_LOGIC_VECTOR (31 downto 0));  --asd
end union;

architecture Behavioral of union is

COMPONENT program_counter
PORT(
	pcadder : IN std_logic_vector(31 downto 0);  --data in
	rst : IN std_logic;
	clk : IN std_logic;          
	salida : OUT std_logic_vector(31 downto 0) --data out
	);
END COMPONENT;

COMPONENT sumador
PORT(
	A : IN std_logic_vector(31 downto 0); --oper1
	B : IN std_logic_vector(31 downto 0);   --oper2       
	C : OUT std_logic_vector(31 downto 0)		--result
	);
END COMPONENT;

	COMPONENT mux_sum
	PORT(
		dispo30 : IN std_logic_vector(31 downto 0);
		dispo22 : IN std_logic_vector(31 downto 0);
		pc4 : IN std_logic_vector(31 downto 0);
		alu_op : IN std_logic_vector(31 downto 0);
		pc_source : IN std_logic_vector(1 downto 0);          
		mux_out : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;


COMPONENT alu
PORT(
	mux_in : IN std_logic_vector(31 downto 0);		--op2
	crs1 : IN std_logic_vector(31 downto 0);		--op1
	uc_in : IN std_logic_vector(5 downto 0);    --op code      
	alu_result : OUT std_logic_vector(31 downto 0);  --result
	c : IN std_logic
	);
END COMPONENT;

	COMPONENT seu22
	PORT(
		disp22 : IN std_logic_vector(21 downto 0);          
		seu_out : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	COMPONENT mux15
	PORT(
		rd_wm : IN std_logic_vector(5 downto 0);
		wm_15 : IN std_logic_vector(5 downto 0);
		RFdest : IN std_logic;          
		nRD : OUT std_logic_vector(5 downto 0)
		);
	END COMPONENT;

--COMPONENT instruction_memory
	--PORT(
		--pc_in : IN std_logic_vector(31 downto 0);  --addres
		--rst : IN std_logic;          
		--im_out : OUT std_logic_vector(31 downto 0)  --result
		--);
	--END COMPONENT;
	
	COMPONENT instructionMemory
	PORT(
		--clk : IN std_logic;
		address : IN std_logic_vector(31 downto 0);
		reset : IN std_logic;          
		outInstruction : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

COMPONENT mux
	PORT(
		crs2 : IN std_logic_vector(31 downto 0);  --a
		seu32 : IN std_logic_vector(31 downto 0);	--b
		i : IN std_logic;          --sel
		mux_out : OUT std_logic_vector(31 downto 0) --salida
		);
	END COMPONENT;

	COMPONENT register_file
	PORT(
		rs1_in : IN std_logic_vector(5 downto 0);
		rs2_in : IN std_logic_vector(5 downto 0);
		rd_in : IN std_logic_vector(5 downto 0);
		dwr_alu : IN std_logic_vector(31 downto 0);
		rst : IN std_logic;
		we : IN std_logic;          
		crd : OUT std_logic_vector(31 downto 0);
		crs1_alu : OUT std_logic_vector(31 downto 0);
		crs2_mux : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
	COMPONENT seu
		PORT(
			simm13 : IN std_logic_vector(12 downto 0);    --imm13      
			seu_out : OUT std_logic_vector(31 downto 0)		--seuimm
			);
		END COMPONENT;
	
	COMPONENT ControlUnit
		PORT(
			op : IN std_logic_vector(1 downto 0);
			op2 : IN std_logic_vector(2 downto 0);
			op3 : IN std_logic_vector(5 downto 0);
			icc : IN std_logic_vector(3 downto 0);
			cond : IN std_logic_vector(3 downto 0);          
			aluop : OUT std_logic_vector(5 downto 0);
			rf_dtn_mux : OUT std_logic;
			we_dm : OUT std_logic;
			rd_dm : OUT std_logic;
			rf_mux : OUT std_logic_vector(1 downto 0);
			we_rf : OUT std_logic;
			pc_mux : OUT std_logic_vector(1 downto 0)
			);
	END COMPONENT;
	
	COMPONENT PSR
	PORT(
		clk : IN std_logic;
		rst : IN std_logic;
		ncwp : IN std_logic_vector(4 downto 0);
		nzvc : IN std_logic_vector(3 downto 0);          
		cwp : OUT std_logic_vector(4 downto 0);
		c : OUT std_logic
		);
	END COMPONENT;

	COMPONENT psr_modifier
	PORT(
		alu_op_psr : IN std_logic_vector(5 downto 0);
		aluresult_psr : IN std_logic_vector(31 downto 0);
		crs1_psr : IN std_logic_vector(31 downto 0);
		mux_psr : IN std_logic_vector(31 downto 0);          
		nzvc : OUT std_logic_vector(3 downto 0)
		);
	END COMPONENT;
	
		COMPONENT windowsManager
	PORT(
		rs1 : IN std_logic_vector(4 downto 0);
		rs2 : IN std_logic_vector(4 downto 0);
		rd : IN std_logic_vector(4 downto 0);
		op : IN std_logic_vector(1 downto 0);
		op3 : IN std_logic_vector(5 downto 0);
		cwp : IN std_logic_vector(4 downto 0);          
		ncwp : OUT std_logic_vector(4 downto 0);
		nrs1 : OUT std_logic_vector(5 downto 0);
		nrs2 : OUT std_logic_vector(5 downto 0);
		nrd : OUT std_logic_vector(5 downto 0)
		);
	END COMPONENT;
	
	COMPONENT seu30
	PORT(
		disp30 : IN std_logic_vector(29 downto 0);          
		seu30_out : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

		COMPONENT mux_final
	PORT(
		datatomem : IN std_logic_vector(31 downto 0);
		alu_out : IN std_logic_vector(31 downto 0);
		pc : IN std_logic_vector(31 downto 0);
		rfsource : IN std_logic_vector(1 downto 0);          
		datatoreg : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	COMPONENT dataMemory
	PORT(
		clk : IN std_logic;
		rst : IN std_logic;
		crd : IN std_logic_vector(31 downto 0);
		re : IN std_logic;
		we : IN std_logic;
		aluo : IN std_logic_vector(31 downto 0);          
		datato : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

signal aux_datainnp : std_logic_vector (31 downto 0); --addaux
signal aux_outsum : std_logic_vector (31 downto 0); --sum
signal aux_outpc : std_logic_vector (31 downto 0); --add
signal salida_im : std_logic_vector (31 downto 0); --ins
signal out_seu : std_logic_vector (31 downto 0);
signal crs1_out : std_logic_vector (31 downto 0);
signal crs2_out : std_logic_vector (31 downto 0);
signal alu_ins : std_logic_vector (5 downto 0);
signal mux_sal : std_logic_vector (31 downto 0);
signal alu_out : std_logic_vector (31 downto 0); --ALUout
signal imm13 : std_logic_vector(12 downto 0);
signal carry : std_logic;
signal cwp_aux: std_logic_vector(4 downto 0);
signal ncwp_aux: std_logic_vector(4 downto 0);
signal nrs1_aux: std_logic_vector(5 downto 0);
signal nrs2_aux: std_logic_vector(5 downto 0);
signal nrd_aux: std_logic_vector(5 downto 0);
signal nzvc_aux: std_logic_vector(3 downto 0);
signal swe_dm: std_logic;
signal srd_dm: std_logic;
signal srf_mux: std_logic_vector(1 downto 0);
signal swe_rf: std_logic;
signal scrd: std_logic_vector(31 downto 0);
signal snrd: std_logic_vector(5 downto 0);
signal sseu22: std_logic_vector (31 downto 0);
signal sseu30: std_logic_vector (31 downto 0);
signal aux_dispo30: std_logic_vector (31 downto 0);
signal aux_dispo22: std_logic_vector (31 downto 0);
signal spc: std_logic_vector(1 downto 0);
signal pcmux_out: std_logic_vector (31 downto 0);
signal sdatato: std_logic_vector (31 downto 0);
signal srfs: std_logic;
signal sdatatoreg: std_logic_vector (31 downto 0);




begin
imm13<=salida_im (12 downto 0);
unout <= sdatatoreg;  --asd aluout

nextprogram_counter: program_counter PORT MAP(
		pcadder => pcmux_out,
		rst => unrst ,
		clk => unclk,
		salida => aux_datainnp
	);

inst_program_counter: program_counter PORT MAP(
		pcadder => aux_datainnp,
		rst => unrst,
		clk => unclk,
		salida => aux_outpc
	);

Inst_sumador: sumador PORT MAP(
	A => "00000000000000000000000000000001",
	B => aux_datainnp,
	C => aux_outsum
);



Inst_alu: alu PORT MAP(
		mux_in => mux_sal,
		crs1 => crs1_out,
		uc_in => alu_ins,
		alu_result => alu_out,
		c=> carry
	);

--Inst_instruction_memory: instruction_memory PORT MAP(
	--	pc_in => aux_outpc ,
		--rst => unrst,
		--im_out => salida_im
	--);

	Inst_instructionMemory: instructionMemory PORT MAP(
		--clk => ,
		address => aux_outpc,
		reset => unrst,
		outInstruction => salida_im 
	);


Inst_mux: mux PORT MAP(
		crs2 => crs2_out,
		seu32 => out_seu,
		i => salida_im (13),
		mux_out => mux_sal 
	);
	
Inst_register_file: register_file PORT MAP(
		rs1_in => nrs1_aux,
		rs2_in => nrs2_aux,
		rd_in => snrd,
		dwr_alu => sdatatoreg,
		rst => unrst,
		crs1_alu => crs1_out,
		crs2_mux => crs2_out,
		crd => scrd,
		we => swe_rf 
	);

		Inst_windowsManager: windowsManager PORT MAP(
		rs1 => salida_im (18 downto 14),
		rs2 => salida_im(4 downto 0),
		rd => salida_im(29 downto 25),
		op => salida_im(31 downto 30),
		op3 => salida_im(24 downto 19),
		cwp => cwp_aux,
		ncwp => ncwp_aux,
		nrs1 => nrs1_aux,
		nrs2 => nrs2_aux,
		nrd => nrd_aux
	);

Inst_dataMemory: dataMemory PORT MAP(
		clk => unclk,
		rst => unrst,
		crd => scrd ,
		re => srd_dm,
		we => swe_dm,
		aluo => alu_out ,
		datato => sdatato
	);




Inst_seu: seu PORT MAP(
		simm13 => imm13,
		seu_out => out_seu
	);

	Inst_mux_sum: mux_sum PORT MAP(
		dispo30 => aux_dispo30,
		dispo22 => aux_dispo22,
		pc4 => aux_outsum,
		alu_op => alu_out,
		pc_source => spc,
		mux_out => pcmux_out
	);


	Inst_PSR: PSR PORT MAP(
		clk => unclk,
		rst => unrst,
		ncwp => ncwp_aux,
		nzvc => nzvc_aux,
		cwp => cwp_aux,
		c => carry
	);
	
		Inst_psr_modifier: psr_modifier PORT MAP(
		alu_op_psr => alu_ins,
		aluresult_psr => alu_out,
		crs1_psr => crs1_out,
		mux_psr => mux_sal,
		nzvc => nzvc_aux
	);
	

	Inst_seu30: seu30 PORT MAP(
			disp30 => salida_im(29 downto 0),
			seu30_out => sseu30
		);
	
	
	Inst_mux15: mux15 PORT MAP(
		rd_wm => nrd_aux,
		wm_15 => "001111",
		RFdest => srfs,
		nRD => snrd
	);

Inst_ControlUnit: ControlUnit PORT MAP(
		op =>  salida_im(31 downto 30),
		op2 => salida_im(24 downto 22),
		op3 => salida_im(24 downto 19),
		icc => nzvc_aux,
		cond => salida_im(28 downto 25),
		aluop => alu_ins,
		rf_dtn_mux => srfs,
		we_dm => swe_dm,
		rd_dm => srd_dm,
		rf_mux => srf_mux,
		we_rf => swe_rf,
		pc_mux => spc
	);

	Inst_seu22: seu22 PORT MAP(
		disp22 => salida_im(21 downto 0),
		seu_out => sseu22
	);

	Inst_mux_final: mux_final PORT MAP(
		datatomem => sdatato,
		alu_out => alu_out,
		pc => aux_outpc ,
		rfsource => srf_mux,
		datatoreg => sdatatoreg
	);
	
	Inst_sumador_dispo30: sumador PORT MAP(
	A => sseu30,
	B => aux_datainnp,
	C => aux_dispo30
);

	Inst_sumador_dispo22: sumador PORT MAP(
		A => aux_datainnp,
		B => sseu22,
		C => aux_dispo22
	);

end Behavioral;

