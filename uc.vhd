library IEEE;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;



entity ControlUnit is
    Port ( op : in  STD_LOGIC_VECTOR (1 downto 0);
			  op2 : in  STD_LOGIC_VECTOR (2 downto 0);
           op3 : in  STD_LOGIC_VECTOR (5 downto 0);
           icc : in STD_LOGIC_VECTOR (3 downto 0);
		     cond : in STD_LOGIC_VECTOR (3 downto 0);
		     aluop : out  STD_LOGIC_VECTOR (5 downto 0);
		     rf_dtn_mux : out STD_LOGIC;
		     we_dm : out STD_LOGIC;
		     rd_dm : out STD_LOGIC;
		     rf_mux : out  STD_LOGIC_VECTOR (1 downto 0);
		     we_rf: out STD_LOGIC;
		     pc_mux : out  STD_LOGIC_VECTOR (1 downto 0));

end ControlUnit;

architecture Behavorial of ControlUnit is

begin
	process(op,op2,op3,icc,cond)
		begin

-------------------------------------------------------------------------------------------------------------
-- Aritmeticas & logicas

		if(op = "10")then

			if(op3 = "000000")then --add
				aluop <= "000000";
				pc_mux <= "10";
				rf_mux <= "01";
				we_rf<= '1';
				rf_dtn_mux <= '0';
				we_dm <= '0';
			end if;


			if(op3 = "000001")then --and
				aluop <= "000001";
				pc_mux <= "10";
				rf_mux <= "01";
				we_rf<= '1';
				rf_dtn_mux <= '0';
				we_dm <= '0';
			end if;


			if(op3 = "000101")then --andn
				aluop <= "000101";
				pc_mux <= "10";
				rf_mux <= "01";
				we_rf<= '1';
				rf_dtn_mux <= '0';
				we_dm <= '0';
			end if;


			if(op3 = "000010")then --or
				aluop <= "000010";
				pc_mux <= "10";
				rf_mux <= "01";
				we_rf<= '1';
				rf_dtn_mux <= '0';
				we_dm <= '0';
			end if;


			if(op3 = "000110")then --orn
				aluop <= "000110";
				pc_mux <= "10";
				rf_mux <= "01";
				we_rf<= '1';
				rf_dtn_mux <= '0';
				we_dm <= '0';
			end if;


			if(op3 = "000011")then --xor
				aluop <= "000011";
				pc_mux <= "10";
				rf_mux <= "01";
				we_rf<= '1';
				rf_dtn_mux <= '0';
				we_dm <= '0';
			end if;


			if(op3 = "000111")then --xnor
				aluop <= "000111";
				pc_mux <= "10";
				rf_mux <= "01";
				we_rf<= '1';
				rf_dtn_mux <= '0';
				we_dm <= '0';
			end if;


			if(op3 = "000100")then --sub
				aluop <= "000100";
				pc_mux <= "10";
				rf_mux <= "01";
				we_rf<= '1';
				rf_dtn_mux <= '0';
				we_dm <= '0';
			end if;


			if(op3 = "010000")then --addcc
				aluop <= "010000";
				pc_mux <= "10";
				rf_mux <= "01";
				we_rf<= '1';
				rf_dtn_mux <= '0';
				we_dm <= '0';
			end if;


			if(op3 = "010100")then --subcc
				aluop <= "010100";
				pc_mux <= "10";
				rf_mux <= "01";
				we_rf<= '1';
				rf_dtn_mux <= '0';
				we_dm <= '0';
			end if;


			if(op3 = "001000")then --addx
				aluop <= "001000";
				pc_mux <= "10";
				rf_mux <= "01";
				we_rf<= '1';
				rf_dtn_mux <= '0';
				we_dm <= '0';
			end if;


			if(op3 = "011000")then --addxcc
				aluop <= "011000";
				pc_mux <= "10";
				rf_mux <= "01";
				we_rf<= '1';
				rf_dtn_mux <= '0';
				we_dm <= '0';
			end if;


			if(op3 = "001100")then --subx
				aluop <= "001100";
				pc_mux <= "10";
				rf_mux <= "01";
				we_rf<= '1';
				rf_dtn_mux <= '0';
				we_dm <= '0';
			end if;


			if(op3 = "011100")then --subxcc
				aluop <= "011100";
				pc_mux <= "10";
				rf_mux <= "01";
				we_rf<= '1';
				rf_dtn_mux <= '0';
				we_dm <= '0';
			end if;


			if(op3 = "010010")then --orcc
				aluop <= "010010";
				pc_mux <= "10";
				rf_mux <= "01";
				we_rf<= '1';
				rf_dtn_mux <= '0';
				we_dm <= '0';
			end if;


			if(op3 = "010001")then --andcc
				aluop <= "010001";
				pc_mux <= "10";
				rf_mux <= "01";
				we_rf<= '1';
				rf_dtn_mux <= '0';
				we_dm <= '0';
			end if;


			if(op3 = "010011")then --xorcc
				aluop <= "010011";
				pc_mux <= "10";
				rf_mux <= "01";
				we_rf<= '1';
				rf_dtn_mux <= '0';
				we_dm <= '0';
			end if;


			if(op3 = "010101")then --andncc
				aluop <= "010101";
				pc_mux <= "10";
				rf_mux <= "01";
				we_rf<= '1';
				rf_dtn_mux <= '0';
				we_dm <= '0';
			end if;


			if(op3 = "010110")then --orncc
				aluop <= "010110";
				pc_mux <= "10";
				rf_mux <= "01";
				we_rf<= '1';
				rf_dtn_mux <= '0';
				we_dm <= '0';
			end if;


			if(op3 = "010111")then --xnorcc
				aluop <= "010111";
				pc_mux <= "10";
				rf_mux <= "01";
				we_rf<= '1';
				rf_dtn_mux <= '0';
				we_dm <= '0';
			end if;


			if(op3 = "100101")then --SLL
				aluop <= "100101";
				pc_mux <= "10";
				rf_mux <= "01";
				we_rf<= '1';
				rf_dtn_mux <= '0';
				we_dm <= '0';
			end if;


			if(op3 = "100110")then --SRL
				aluop <= "100110";
				pc_mux <= "10";
				rf_mux <= "01";
				we_rf<= '1';
				rf_dtn_mux <= '0';
				we_dm <= '0';
			end if;


			if(op3 = "111100")then --Save
				aluop <= "111100";
				pc_mux <= "10";
				rf_mux <= "01";
				we_rf<= '1';
				rf_dtn_mux <= '0';
				we_dm <= '0';
			end if;


			if(op3 = "111101")then --Restore
				aluop <= "111101"; 
				pc_mux <= "10";
				rf_mux <= "01";
				we_rf<= '1';
				rf_dtn_mux <= '0';
				we_dm <= '0';
			end if;

			if(op3 = "111000")then --Jump and link
				aluop <= "000000"; ---27  --> valor que tenia antes 011011
				pc_mux <= "11";
				rf_mux <= "01";
				we_rf<= '1';
				rf_dtn_mux <= '0';
				we_dm <= '0';
			end if;



		end if;

----------------------------------------------------------------------------------------------------
-- CALL

		if (op = "01")then	-- CALL
			aluop <= "111111";
			pc_mux <= "00"; -- PC = PC + (1* disp30)
			rf_mux <= "10";
			we_rf<= '1';
			rf_dtn_mux <= '1';
			we_dm <= '0';
			end if ;





	 if (op= "00") then
----------------------------------------------------------------------------------------------------
--BRANCH
		if (op2 = "010")then

			if (cond = "1000")then	-- BA
				aluop <= "111111";
				pc_mux <= "01";
				rf_mux <= "00";
				we_rf<= '0';
				rf_dtn_mux <= '0';
				we_dm <= '0';
			end if;

			if (cond = "1001")then -- BNE
				if (not(icc(2)) = '1')then	-- not z
				aluop <= "111111";
				pc_mux <= "01";
				rf_mux <= "00";
				we_rf<= '0';
				rf_dtn_mux <= '0';
				we_dm <= '0';
			else
				aluop <= "111111";
				pc_mux <= "10";
				rf_mux <= "00";
				we_rf<= '0';
				rf_dtn_mux <= '0';
				we_dm <= '0';
				end if;
			end if;

			if (cond = "0001")then -- BE
				if (icc(2) = '1')then	--  z
				aluop <= "111111";
				pc_mux <= "01";
				rf_mux <= "00";
				we_rf<= '0';
				rf_dtn_mux <= '0';
				we_dm <= '0';
			else
				aluop <= "111111";
				pc_mux <= "10";
				rf_mux <= "00";
				we_rf<= '0';
				rf_dtn_mux <= '0';
				we_dm <= '0';
				end if;
			end if;


			if (cond = "1010")then -- BG
				if (not(icc(2) or (icc(3) xor icc(1))) = '1')then	-- not(z or (N xor V))
				aluop <= "111111";
				pc_mux <= "01";
				rf_mux <= "00";
				we_rf<= '0';
				rf_dtn_mux <= '0';
				we_dm <= '0';
			else
				aluop <= "111111";
				pc_mux <= "10";
				rf_mux <= "00";
				we_rf<= '0';
				rf_dtn_mux <= '0';
				we_dm <= '0';
				end if;
			end if;


			if (cond = "1001")then -- BLE
				if ((icc(2) or (icc(3) xor icc(1))) = '1')then	-- z or (N xor V))
				aluop <= "111111";
				pc_mux <= "01";
				rf_mux <= "00";
				we_rf<= '0';
				rf_dtn_mux <= '0';
				we_dm <= '0';
			else
				aluop <= "111111";
				pc_mux <= "10";
				rf_mux <= "00";
				we_rf<= '0';
				rf_dtn_mux <= '0';
				we_dm <= '0';
				end if;
			end if;

			if (cond = "1011")then -- BGE
				if (not(icc(3) xor icc(1)) = '1')then	-- Not (N xor V)
				aluop <= "111111";
				pc_mux <= "01";
				rf_mux <= "00";
				we_rf<= '0';
				rf_dtn_mux <= '0';
				we_dm <= '0';
			else
				aluop <= "111111";
				pc_mux <= "10";
				rf_mux <= "00";
				we_rf<= '0';
				rf_dtn_mux <= '0';
				we_dm <= '0';
				end if;
			end if;


			if (cond = "0011")then -- BL
				if ((icc(3) xor icc(1)) = '1')then	-- N xor V
				aluop <= "111111";
				pc_mux <= "01";
				rf_mux <= "00";
				we_rf<= '0';
				rf_dtn_mux <= '0';
				we_dm <= '0';
			else
				aluop <= "111111";
				pc_mux <= "10";
				rf_mux <= "00";
				we_rf<= '0';
				rf_dtn_mux <= '0';
				we_dm <= '0';
				end if;
			end if;



			if (cond = "1100")then -- BGU
				if (not(icc(0) or icc(2)) = '1')then	-- Not (C or Z)
				aluop <= "111111";
				pc_mux <= "01";
				rf_mux <= "00";
				we_rf<= '0';
				rf_dtn_mux <= '0';
				we_dm <= '0';
			else
				aluop <= "111111";
				pc_mux <= "10";
				rf_mux <= "00";
				we_rf<= '0';
				rf_dtn_mux <= '0';
				we_dm <= '0';
				end if;
			end if;



			if (cond = "0100")then -- BLEU
				if ((icc(0) or icc(2)) = '1')then	-- C or Z
				aluop <= "111111";
				pc_mux <= "01";
				rf_mux <= "00";
				we_rf<= '0';
				rf_dtn_mux <= '0';
				we_dm <= '0';
			else
				aluop <= "111111";
				pc_mux <= "10";
				rf_mux <= "00";
				we_rf<= '0';
				rf_dtn_mux <= '0';
				we_dm <= '0';
				end if;
			end if;


			if (cond = "1101")then -- BCC
				if (not(icc(0)) = '1')then	-- Not c
				aluop <= "111111";
				pc_mux <= "01";
				rf_mux <= "00";
				we_rf<= '0';
				rf_dtn_mux <= '0';
				we_dm <= '0';
			else
				aluop <= "111111";
				pc_mux <= "10";
				rf_mux <= "00";
				we_rf<= '0';
				rf_dtn_mux <= '0';
				we_dm <= '0';
				end if;
			end if;

			if (cond = "0101")then -- BCS
				if (icc(0) = '1')then	--  c
				aluop <= "111111";
				pc_mux <= "01";
				rf_mux <= "00";
				we_rf<= '0';
				rf_dtn_mux <= '0';
				we_dm <= '0';
			else
				aluop <= "111111";
				pc_mux <= "10";
				rf_mux <= "00";
				we_rf<= '0';
				rf_dtn_mux <= '0';
				we_dm <= '0';
				end if;
			end if;

			if (cond = "1110")then -- BPOS
				if (not(icc(3)) = '1')then	-- Not N
				aluop <= "111111";
				pc_mux <= "01";
				rf_mux <= "00";
				we_rf<= '0';
				rf_dtn_mux <= '0';
				we_dm <= '0';
			else
				aluop <= "111111";
				pc_mux <= "10";
				rf_mux <= "00";
				we_rf<= '0';
				rf_dtn_mux <= '0';
				we_dm <= '0';
				end if;
			end if;

			if (cond = "0110")then -- BNEG
				if (icc(3) = '1')then	-- N
				aluop <= "111111";
				pc_mux <= "01";
				rf_mux <= "00";
				we_rf<= '0';
				rf_dtn_mux <= '0';
				we_dm <= '0';
			else
				aluop <= "111111";
				pc_mux <= "10";
				rf_mux <= "00";
				we_rf<= '0';
				rf_dtn_mux <= '0';
				we_dm <= '0';
				end if;
			end if;

			if (cond = "1111")then -- BVC
				if (not(icc(1)) = '1')then	-- Not V
				aluop <= "111111";
				pc_mux <= "01";
				rf_mux <= "00";
				we_rf<= '0';
				rf_dtn_mux <= '0';
				we_dm <= '0';
			else
				aluop <= "111111";
				pc_mux <= "10";
				rf_mux <= "00";
				we_rf<= '0';
				rf_dtn_mux <= '0';
				we_dm <= '0';
				end if;
			end if;

			if (cond = "1101")then -- BVS
				if (icc(1) = '1')then	-- V
				aluop <= "111111";
				pc_mux <= "01";
				rf_mux <= "00";
				we_rf<= '0';
				rf_dtn_mux <= '0';
				we_dm <= '0';
			else
				aluop <= "111111";
				pc_mux <= "10";
				rf_mux <= "00";
				we_rf<= '0';
				rf_dtn_mux <= '0';
				we_dm <= '0';
				end if;
			end if;

			if (cond = "0000")then -- BN
												-- 0
				aluop <= "111111";
				pc_mux <= "10";
				rf_mux <= "00";
				we_rf<= '0';
				rf_dtn_mux <= '0';
				we_dm <= '0';

			end if;



		end if;
		----------------------------------------------------------------------------------------------------
--SETHI

		if (op2 = "100")then

				aluop <= "111111";
				pc_mux <= "01";
				rf_mux <= "01";
				we_rf<= '0';
				rf_dtn_mux <= '0';
				we_dm <= '0';

		end if;

	end if;
----------------------------------------------------------------------------------------------------
--LOAD y STORE

	if (op= "11") then
		if(OP3="000000") then --load

				aluop <= "000000";
				pc_mux <= "10";
				rf_mux <= "00";
				we_rf<= '1';
				rf_dtn_mux <= '0';
				we_dm <= '0';


		end if;

		if(OP3="000100") then --store

				aluop <= "000000";
				pc_mux <= "10";
				rf_mux <= "00";
				we_rf<= '0';
				rf_dtn_mux <= '0';
				we_dm <= '0';

		end if;


	end if;
	rd_dm<='1';
	end process;

end Behavorial;