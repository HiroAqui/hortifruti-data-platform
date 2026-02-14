-- ============================================
-- Migration 001 - Core tables (Hortifruti)
-- ============================================

-- Criar schema principal
CREATE SCHEMA IF NOT EXISTS core;

-- ============================================
-- Tabela: Loja
-- ============================================
CREATE TABLE core.loja (
    loja_id        SERIAL PRIMARY KEY,
    nome           VARCHAR(100) NOT NULL,
    rua         VARCHAR(80),
    
    created_at     TIMESTAMP DEFAULT NOW()
);

-- ============================================
-- Tabela: Categoria de Produto
-- ============================================
CREATE TABLE core.categoria_produto (
    categoria_id   SERIAL PRIMARY KEY,
    nome           VARCHAR(80) NOT NULL UNIQUE,

    created_at     TIMESTAMP DEFAULT NOW()
);

-- ============================================
-- Tabela: Unidade de Medida
-- ============================================
CREATE TABLE core.unidade_medida (
    unidade_id     SERIAL PRIMARY KEY,
    sigla          VARCHAR(10) NOT NULL UNIQUE,
    descricao      VARCHAR(50),

    created_at     TIMESTAMP DEFAULT NOW()
);

-- ============================================
-- Tabela: Fornecedor
-- ============================================
CREATE TABLE core.fornecedor (
    fornecedor_id  SERIAL PRIMARY KEY,
    nome           VARCHAR(120) NOT NULL,
    telefone       VARCHAR(30),
    email          VARCHAR(120),

    created_at     TIMESTAMP DEFAULT NOW()
);

-- ============================================
-- Tabela: Produto
-- ============================================
CREATE TABLE core.produto (
    produto_id       SERIAL PRIMARY KEY,
    nome             VARCHAR(120) NOT NULL,

    categoria_id     INT NOT NULL,
    unidade_id       INT NOT NULL,
    fornecedor_id    INT,

    perecivel        BOOLEAN DEFAULT TRUE,
    ativo            BOOLEAN DEFAULT TRUE,

    created_at       TIMESTAMP DEFAULT NOW(),

    CONSTRAINT fk_categoria
        FOREIGN KEY (categoria_id)
        REFERENCES core.categoria_produto(categoria_id),

    CONSTRAINT fk_unidade
        FOREIGN KEY (unidade_id)
        REFERENCES core.unidade_medida(unidade_id),

    CONSTRAINT fk_fornecedor
        FOREIGN KEY (fornecedor_id)
        REFERENCES core.fornecedor(fornecedor_id)
);

-- ============================================
-- Índices (performance)
-- ============================================
CREATE INDEX idx_produto_nome
    ON core.produto(nome);

CREATE INDEX idx_produto_categoria
    ON core.produto(categoria_id);
