-- Importa os dados dos arquivos csv
set datestyle to "ISO,DMY";
copy public."Relacao_Operadoras_Ativas_ANS" ("Registro ANS", "CNPJ", "Razão Social", "Nome Fantasia", "Modalidade", "Logradouro", "Número", "Complemento","Bairro", "Cidade", "UF", "CEP", "DDD", "Telefone", "Fax", "Endereço eletrônico", "Representante", "Cargo Representante", "Data Registro ANS") FROM '/home/hugo/Public/tmp/relatorio_cadop_t3.csv' DELIMITER ';' CSV HEADER ENCODING 'WIN1252';

copy public."demonstracoes_contabeis" ("Data", "REG_ANS", "CD_CONTA_CONTABEIS", "DESCRICAO", "VL_SALDO_FINAL") FROM '/home/hugo/Public/tmp/1T2020.csv' DELIMITER ';' CSV HEADER ENCODING 'WIN1252';
copy public."demonstracoes_contabeis" ("Data", "REG_ANS", "CD_CONTA_CONTABEIS", "DESCRICAO", "VL_SALDO_FINAL") FROM '/home/hugo/Public/tmp/2T2020.csv' DELIMITER ';' CSV HEADER ENCODING 'WIN1252';
copy public."demonstracoes_contabeis" ("Data", "REG_ANS", "CD_CONTA_CONTABEIS", "DESCRICAO", "VL_SALDO_FINAL") FROM '/home/hugo/Public/tmp/3T2020.csv' DELIMITER ';' CSV HEADER ENCODING 'WIN1252';
copy public."demonstracoes_contabeis" ("Data", "REG_ANS", "CD_CONTA_CONTABEIS", "DESCRICAO", "VL_SALDO_FINAL") FROM '/home/hugo/Public/tmp/4T2020.csv' DELIMITER ';' CSV HEADER ENCODING 'WIN1252';
copy public."demonstracoes_contabeis" ("Data", "REG_ANS", "CD_CONTA_CONTABEIS", "DESCRICAO", "VL_SALDO_FINAL") FROM '/home/hugo/Public/tmp/1T2021.csv' DELIMITER ';' CSV HEADER ENCODING 'WIN1252';
copy public."demonstracoes_contabeis" ("Data", "REG_ANS", "CD_CONTA_CONTABEIS", "DESCRICAO", "VL_SALDO_FINAL") FROM '/home/hugo/Public/tmp/2T2021.csv' DELIMITER ';' CSV HEADER ENCODING 'WIN1252';
copy public."demonstracoes_contabeis" ("Data", "REG_ANS", "CD_CONTA_CONTABEIS", "DESCRICAO", "VL_SALDO_FINAL") FROM '/home/hugo/Public/tmp/3T2021.csv' DELIMITER ';' CSV HEADER ENCODING 'WIN1252';
copy public."demonstracoes_contabeis" ("Data", "REG_ANS", "CD_CONTA_CONTABEIS", "DESCRICAO", "VL_SALDO_INICIAL" , "VL_SALDO_FINAL") FROM '/home/hugo/Public/tmp/4T2021.csv' DELIMITER ';' CSV HEADER ENCODING 'WIN1252';
set lc_numeric = "de_DE.UTF-8";
--Altera as colunas de saldo para valores numericos
ALTER TABLE PUBLIC."demonstracoes_contabeis" ALTER COLUMN "VL_SALDO_INICIAL" TYPE NUMERIC(20,2) USING(TO_NUMBER("VL_SALDO_INICIAL",'999999999999999D99S'));
ALTER TABLE PUBLIC."demonstracoes_contabeis" ALTER COLUMN "VL_SALDO_FINAL" TYPE NUMERIC(20,2) USING(TO_NUMBER("VL_SALDO_FINAL",'999999999999999D99S'));
SELECT * FROM PUBLIC."demonstracoes_contabeis" WHERE "VL_SALDO_INICIAL" > 0 ORDER BY "VL_SALDO_INICIAL" desc;


SELECT * FROM PUBLIC."demonstracoes_contabeis" ORDER BY "Data" DESC;

DROP TABLE public."Relacao_Operadoras_Ativas_ANS";
DROP TABLE PUBLIC."demonstracoes_contabeis";