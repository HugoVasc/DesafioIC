-- Importa os dados dos arquivos csv
--set datestyle to "ISO,DMY";
copy public.relacao_operadoras_ativas_ans ("reg_ans", "cnpj", "razao_social", "nome_fantasia", "modalidade", "logradouro", "numero", "complemento","bairro", "cidade", "uf", "cep", "ddd", "telefone", "fax", "email", "representante", "cargo_representante", "data_reg_ans") FROM 'C:/Users/Public/DesafioIC_T3/relatorio_cadop_t3.csv' DELIMITER ';' CSV HEADER ENCODING 'WIN1252';

--Teste de importacao
--SELECT * FROM public."Relacao_Operadoras_Ativas_ANS"; 
copy public.demonstracoes_contabeis ("data", "reg_ans", "cd_conta_contabeis", "descricao", "vl_saldo_final") FROM 'C:/Users/Public/DesafioIC_T3/1T2020.csv' DELIMITER ';' CSV HEADER ENCODING 'WIN1252';
copy public.demonstracoes_contabeis ("data", "reg_ans", "cd_conta_contabeis", "descricao", "vl_saldo_final") FROM 'C:/Users/Public/DesafioIC_T3/2T2020.csv' DELIMITER ';' CSV HEADER ENCODING 'WIN1252';
copy public.demonstracoes_contabeis ("data", "reg_ans", "cd_conta_contabeis", "descricao", "vl_saldo_final") FROM 'C:/Users/Public/DesafioIC_T3/3T2020.csv' DELIMITER ';' CSV HEADER ENCODING 'WIN1252';
copy public.demonstracoes_contabeis ("data", "reg_ans", "cd_conta_contabeis", "descricao", "vl_saldo_final") FROM 'C:/Users/Public/DesafioIC_T3/4T2020.csv' DELIMITER ';' CSV HEADER ENCODING 'WIN1252';
copy public.demonstracoes_contabeis ("data", "reg_ans", "cd_conta_contabeis", "descricao", "vl_saldo_final") FROM 'C:/Users/Public/DesafioIC_T3/1T2021.csv' DELIMITER ';' CSV HEADER ENCODING 'WIN1252';
copy public.demonstracoes_contabeis ("data", "reg_ans", "cd_conta_contabeis", "descricao", "vl_saldo_final") FROM 'C:/Users/Public/DesafioIC_T3/2T2021.csv' DELIMITER ';' CSV HEADER ENCODING 'WIN1252';
copy public.demonstracoes_contabeis ("data", "reg_ans", "cd_conta_contabeis", "descricao", "vl_saldo_final") FROM 'C:/Users/Public/DesafioIC_T3/3T2021.csv' DELIMITER ';' CSV HEADER ENCODING 'WIN1252';
copy public.demonstracoes_contabeis ("data", "reg_ans", "cd_conta_contabeis", "descricao", "vl_saldo_inicial" , "vl_saldo_final") FROM 'C:/Users/Public/DesafioIC_T3/4T2021.csv' DELIMITER ';' CSV HEADER ENCODING 'WIN1252';

--Altera as colunas de saldo para valores numericos
ALTER TABLE PUBLIC.demonstracoes_contabeis ALTER COLUMN vl_saldo_inicial TYPE NUMERIC(20,2) USING(TO_NUMBER("vl_saldo_inicial",'999999999999999D99S'));
ALTER TABLE PUBLIC.demonstracoes_contabeis ALTER COLUMN vl_saldo_final TYPE NUMERIC(20,2) USING(TO_NUMBER("vl_saldo_final",'999999999999999D99S'));

--DROP TABLE public.relacao_operadoras_ativas_ans;
--DROP TABLE PUBLIC.demonstracoes_contabeis;