----------------------------------------------------------------------------------
-- Company: 

--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity psr_modifier is
    Port ( alu_op_psr : in  STD_LOGIC_VECTOR (5 downto 0);
           aluresult_psr : in  STD_LOGIC_VECTOR (31 downto 0);
           crs1_psr : in  STD_LOGIC_VECTOR (31 downto 0);
           mux_psr : in  STD_LOGIC_VECTOR (31 downto 0);
           nzvc : out  STD_LOGIC_VECTOR (3 downto 0));
end psr_modifier;

architecture Behavioral of psr_modifier is

begin
process(alu_op_psr, aluresult_psr,crs1_psr, mux_psr)
begin

	if (alu_op_psr = "010000" or alu_op_psr = "011000")then --los numeros indican que son para el addcc y el addxcc
		nzvc(3) <= aluresult_psr(31);
		if aluresult_psr = "00000000000000000000000000000000" then 
			nzvc(2)<='1';       --indica que ambos numeros son iguales 
		else
			nzvc(2)<='0';
		end if;
		--AQUI VA EL VISAJE QUE NO SE ENTIENDE AUN
		nzvc(1) <= (crs1_psr(31) AND mux_psr(31) AND (NOT aluresult_psr(31))) OR ((NOT crs1_psr(31)) AND ( NOT mux_psr(31)) AND aluresult_psr(31));
		nzvc(0) <= (crs1_psr(31) AND mux_psr(31)) OR ((NOT aluresult_psr(31)) AND (crs1_psr(31) OR mux_psr(31)));
	end if;

	if (alu_op_psr = "010100" or alu_op_psr = "011100")then --los numeros indican que son para el SUBcc y el SUBxcc
		nzvc(3) <= aluresult_psr(31);
		if aluresult_psr = "00000000000000000000000000000000" then 
			nzvc(2)<='1';       --indica que ambos numeros son iguales 
		else
			nzvc(2)<='0';
		end if;
		--AQUI VA EL VISAJE QUE NO SE ENTIENDE AUN
		nzvc(1) <= (crs1_psr(31) AND (NOT mux_psr(31)) AND (NOT aluresult_psr(31))) OR ((NOT crs1_psr(31)) AND mux_psr(31) AND aluresult_psr(31));
		nzvc(0) <= ((not crs1_psr(31)) and mux_psr(31)) or (aluresult_psr(31) and ((not crs1_psr(31)) or mux_psr(31)));
		
	end if;

	if (alu_op_psr = "010001" or alu_op_psr = "010101" or alu_op_psr = "010010" or alu_op_psr = "010110" or alu_op_psr = "010011" or alu_op_psr = "010111")then --los numeros indican que son para LAS OPERACIONES LOGICAS ANDCC, ANDNCC, ORCC, ORNCC, XORCC, XNORCC
		nzvc(3) <= aluresult_psr(31);
		if aluresult_psr = "00000000000000000000000000000000" then 
			nzvc(2)<='1';       --indica que ambos numeros son iguales 
		else
			nzvc(2)<='0';
		end if;
		--AQUI VA EL VISAJE QUE NO SE ENTIENDE AUN 
		nzvc(1) <= '0';
		nzvc(0) <= '0';
			
	end if;
	


		
			
		
	





end process;


end Behavioral;

