CREATE TABLE public.categoria (
	id int4 NOT NULL,
	nome varchar NULL,
	CONSTRAINT categoria_pkey PRIMARY KEY (id)
);

CREATE TABLE public.loja (
	id int4 NOT NULL DEFAULT nextval('empresa_id_seq'::regclass),
	nome varchar NULL,
	longitude float4 NULL,
	latitude float4 NULL,
	CONSTRAINT empresa_pkey PRIMARY KEY (id)
);

CREATE TABLE public.produto (
	id int4 NOT NULL,
	nome varchar NULL,
	categoria_id int4 NULL,
	CONSTRAINT produto_pkey PRIMARY KEY (id),
	CONSTRAINT produto_categoria_id_fkey FOREIGN KEY (categoria_id) REFERENCES categoria(id)
);

CREATE TABLE public.loja_produto_historico (
	id int4 NOT NULL,
	valor numeric(4,2) NOT NULL,
	"data" timestamp NOT NULL,
	produto_id int4 NULL,
	loja_id int4 NULL,
	CONSTRAINT produto_preco_pkey PRIMARY KEY (id),
	CONSTRAINT loja_produto_loja_id_fkey FOREIGN KEY (loja_id) REFERENCES loja(id),
	CONSTRAINT loja_produto_produto_id_fkey FOREIGN KEY (produto_id) REFERENCES produto(id)
);