# Hortifruti Data Platform 

Projeto de Engenharia de Dados end-to-end inspirado em um hortifruti real.

## Objetivo
Construir uma plataforma de dados completa com:

- PostgreSQL (OLTP)
- dbt (camada analítica)
- Pipeline ETL/ELT em Python
- Orquestração com Prefect
- Dashboards no Power BI
- Boas práticas de engenharia (CI, testes, documentação)

## Arquitetura (MVP)
Fonte → Postgres → dbt → Data Mart → Power BI
