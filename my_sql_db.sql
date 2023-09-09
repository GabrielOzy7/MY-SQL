/*Create data base*/
CREATE SCHEMA CLUBE_DO_LIVRO;

/*Table of books*/
CREATE TABLE LIVROS(
ID_LIVRO int NOT NULL, 
NOME_LIVRO VARCHAR(100) NOT NULL,
AUTORIA VARCHAR(100) NOT NULL,
EDITORA VARCHAR(100) NOT NULL,
CATEGORIA VARCHAR(100) NOT NULL,
PREÇO DECIMAL(5,2) NOT NULL,

/*Define primary key for table book */
PRIMARY KEY (ID_LIVRO)
);

CREATE TABLE ESTOQUE (
ID_LIVRO INT NOT NULL,
QTD_ESTOQUE INT NOT NULL,

PRIMARY KEY (ID_LIVRO)
);

CREATE TABLE VENDAS (
ID_PEDIDO INT NOT NULL,
ID_VENDEDOR INT NOT NULL,
ID_LIVRO INT NOT NULL,
QTD_VENDIDA INT NOT NULL,
DATA_VENDA DATE NOT NULL,

PRIMARY KEY (ID_VENDEDOR, ID_PEDIDO)
);


/* Tabela de Vendedores */
CREATE TABLE VENDEDORES (
ID_VENDEDOR INT NOT NULL,
NOME_VENDEDOR VARCHAR(255) NOT NULL,

PRIMARY KEY (ID_VENDEDOR)
);


ALTER TABLE ESTOQUE ADD CONSTRAINT CE_ESTOQUE_LIVROS
FOREIGN KEY (ID_LIVRO)
REFERENCES LIVROS (ID_LIVRO) 
ON DELETE NO ACTION
ON UPDATE NO ACTION;


ALTER TABLE VENDAS ADD CONSTRAINT CE_VENDAS_LIVROS
FOREIGN KEY (ID_LIVRO)
REFERENCES LIVROS (ID_LIVRO)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE VENDAS ADD CONSTRAINT CE_VENDAS_VENDEDORES
FOREIGN KEY (ID_VENDEDOR)
REFERENCES VENDEDORES (ID_VENDEDOR)
ON DELETE NO ACTION
ON UPDATE NO ACTION;