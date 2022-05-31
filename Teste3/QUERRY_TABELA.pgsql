CREATE DATABASE "IntuitiveCare"
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'Portuguese_Brazil.1252'
    LC_CTYPE = 'Portuguese_Brazil.1252'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;
-- Table: public.Relacao_Operadoras_Ativas_ANS

-- DROP TABLE IF EXISTS public."Relacao_Operadoras_Ativas_ANS";

CREATE TABLE IF NOT EXISTS public."Relacao_Operadoras_Ativas_ANS"
(
    "Registro ANS" integer NOT NULL,
    "CNPJ" character varying(15) COLLATE pg_catalog."default" NOT NULL,
    "Razão Social" text COLLATE pg_catalog."default" NOT NULL,
    "Nome Fantasia" text COLLATE pg_catalog."default",
    "Modalidade" character varying(35) COLLATE pg_catalog."default" NOT NULL,
    "Logradouro" text COLLATE pg_catalog."default" NOT NULL,
    "Número" character varying(25) COLLATE pg_catalog."default" NOT NULL,
    "Complemento" text COLLATE pg_catalog."default",
    "Bairro" text COLLATE pg_catalog."default" NOT NULL,
    "Cidade" text COLLATE pg_catalog."default" NOT NULL,
    "UF" character(2) COLLATE pg_catalog."default" NOT NULL,
    "CEP" numeric(8,0) NOT NULL,
    "DDD" numeric(2,0),
    "Telefone" character varying(16) COLLATE pg_catalog."default",
    "Fax" numeric(11,0),
    "Endereço eletrônico" text COLLATE pg_catalog."default",
    "Representante" text COLLATE pg_catalog."default" NOT NULL,
    "Cargo Representante" text COLLATE pg_catalog."default" NOT NULL,
    "Data Registro ANS" date NOT NULL,
    CONSTRAINT "Relacao_Operadoras_Ativas_ANS_pkey" PRIMARY KEY ("Registro ANS")
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."Relacao_Operadoras_Ativas_ANS"
    OWNER to postgres;


-- Table: public.demonstracoes_contabeis

-- DROP TABLE IF EXISTS public.demonstracoes_contabeis;

CREATE TABLE IF NOT EXISTS public.demonstracoes_contabeis
(
    "Data" date NOT NULL,
    "REG_ANS" integer NOT NULL,
    "CD_CONTA_CONTABEIS" bigint NOT NULL,
    "DESCRICAO" text COLLATE pg_catalog."default" NOT NULL,
    "VL_SALDO_INICIAL" varchar(20),
    "VL_SALDO_FINAL" varchar(20) NOT NULL
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.demonstracoes_contabeis
    OWNER to postgres;