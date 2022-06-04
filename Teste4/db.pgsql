-- Criacao do banco de dados
CREATE DATABASE "DB"
    WITH
    OWNER = postgres
    TEMPLATE = template0
    ENCODING = 'WIN1252'
    LC_COLLATE = 'Portuguese_Brazil.1252'
    LC_CTYPE = 'Portuguese_Brazil.1252'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;

-- Criacao da tabela
CREATE TABLE IF NOT EXISTS public.relacao_operadoras_ativas_ans
(
    "reg_ans" integer NOT NULL,
    "cnpj" character varying(15) COLLATE pg_catalog."default" NOT NULL,
    "razao_social" text COLLATE pg_catalog."default" NOT NULL,
    "nome_fantasia" text COLLATE pg_catalog."default",
    "modalidade" character varying(35) COLLATE pg_catalog."default" NOT NULL,
    "logradouro" text COLLATE pg_catalog."default" NOT NULL,
    "numero" character varying(25) COLLATE pg_catalog."default" NOT NULL,
    "complemento" text COLLATE pg_catalog."default",
    "bairro" text COLLATE pg_catalog."default" NOT NULL,
    "cidade" text COLLATE pg_catalog."default" NOT NULL,
    "uf" character(2) COLLATE pg_catalog."default" NOT NULL,
    "cep" numeric(8,0) NOT NULL,
    "ddd" numeric(2,0),
    "telefone" character varying(16) COLLATE pg_catalog."default",
    "fax" numeric(11,0),
    "email" text COLLATE pg_catalog."default",
    "representante" text COLLATE pg_catalog."default" NOT NULL,
    "cargo_representante" text COLLATE pg_catalog."default" NOT NULL,
    "data_reg_ans" date NOT NULL,
    CONSTRAINT "relacao_operadoras_ativas_ans_pkey" PRIMARY KEY ("reg_ans")
)
TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.relacao_operadoras_ativas_ans
    OWNER to postgres;

-- Load dos conteudo da tabela
copy public.relacao_operadoras_ativas_ans FROM 'C:/Users/Public/DesafioIC_T4/relatorio_cadop_t4.csv' DELIMITER ';' CSV HEADER ENCODING 'WIN1252';