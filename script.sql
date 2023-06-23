CREATE TABLE public.usuarios (
                id_usuario NUMERIC(38) NOT NULL,
                email VARCHAR(255) NOT NULL,
                senha VARCHAR(255) NOT NULL,
                sexo CHAR(1),
                nome VARCHAR(255),
                nascimento DATE,
                CONSTRAINT usuarios_pk PRIMARY KEY (id_usuario)
);


CREATE TABLE public.posts (
                id_post NUMERIC(38) NOT NULL,
                data de postagem DATE,
                conteudo VARCHAR(255) NOT NULL,
                id_usuario NUMERIC(38) NOT NULL,
                CONSTRAINT posts_pk PRIMARY KEY (id_post)
);


CREATE TABLE public.comentarios (
                id_comentario NUMERIC(38) NOT NULL,
                data do comentario DATE,
                conteudo VARCHAR(255) NOT NULL,
                id_post NUMERIC(38) NOT NULL,
                id_usuario NUMERIC(38) NOT NULL,
                CONSTRAINT comentarios_pk PRIMARY KEY (id_comentario)
);


CREATE TABLE public.telefone (
                id_telefone NUMERIC(38) NOT NULL,
                ddd NUMERIC(2) NOT NULL,
                numero NUMERIC(10) NOT NULL,
                id_usuario NUMERIC(38) NOT NULL,
                CONSTRAINT telefone_pk PRIMARY KEY (id_telefone)
);


CREATE TABLE public.amigos (
                id_amigo NUMERIC(38) NOT NULL,
                data da amizade DATE,
                id_usuario NUMERIC(38) NOT NULL,
                CONSTRAINT amigos_pk PRIMARY KEY (id_amigo)
);


CREATE TABLE public.endereço (
                id_endereço NUMERIC(38) NOT NULL,
                cep VARCHAR(255) NOT NULL,
                bairro VARCHAR(255),
                rua VARCHAR(255),
                pais VARCHAR(255) NOT NULL,
                complemento VARCHAR(255) NOT NULL,
                usuarios_id NUMERIC(38) NOT NULL,
                CONSTRAINT endere_o_pk PRIMARY KEY (id_endereço)
);


ALTER TABLE public.endereço ADD CONSTRAINT usuarios_endere_o_fk
FOREIGN KEY (usuarios_id)
REFERENCES public.usuarios (id_usuario)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.amigos ADD CONSTRAINT usuarios_amigos_fk
FOREIGN KEY (id_usuario)
REFERENCES public.usuarios (id_usuario)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.telefone ADD CONSTRAINT usuarios_telefone_fk
FOREIGN KEY (id_usuario)
REFERENCES public.usuarios (id_usuario)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.posts ADD CONSTRAINT usuarios_posts_fk
FOREIGN KEY (id_usuario)
REFERENCES public.usuarios (id_usuario)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.comentarios ADD CONSTRAINT usuarios_comentarios_fk
FOREIGN KEY (id_usuario)
REFERENCES public.usuarios (id_usuario)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.comentarios ADD CONSTRAINT posts_comentarios_fk
FOREIGN KEY (id_post)
REFERENCES public.posts (id_post)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;
