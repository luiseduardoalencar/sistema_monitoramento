/*
  Warnings:

  - A unique constraint covering the columns `[ag_alimentador_nome]` on the table `agentes_alimentadores` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[ag_alimentador_cpf]` on the table `agentes_alimentadores` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[ag_alimentador_cnpj]` on the table `agentes_alimentadores` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[ag_fiscal_nome]` on the table `agentes_fiscais` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[ag_fiscal_cpf]` on the table `agentes_fiscais` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[ag_fiscal_cnpj]` on the table `agentes_fiscais` will be added. If there are existing duplicate values, this will fail.

*/
-- CreateTable
CREATE TABLE "projetos" (
    "nome_projeto" TEXT NOT NULL,
    "data_inicio" TEXT NOT NULL,
    "prazo_exec" TEXT NOT NULL,
    "cod_unico" TEXT NOT NULL,
    "cod_ibge" TEXT NOT NULL,
    "cnae" TEXT NOT NULL,
    "ag_alimentador_nome" TEXT NOT NULL,
    "ag_alimentador_cpf" TEXT NOT NULL,
    "ag_alimentador_cnpj" TEXT NOT NULL,
    "ag_fiscal_nome" TEXT NOT NULL,
    "ag_fiscal_cpf" TEXT NOT NULL,
    "ag_fiscal_cnpj" TEXT NOT NULL,
    "exec_projeto" TEXT NOT NULL,
    "justificativa" TEXT NOT NULL,
    "canal_comunicacao" TEXT NOT NULL,
    "orcamento" TEXT NOT NULL,
    "previsao_de_custo" TEXT NOT NULL,
    "acoes" TEXT NOT NULL,
    "atividades" TEXT NOT NULL,
    "subatividades" TEXT NOT NULL,
    "tarefas" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "projetos_pkey" PRIMARY KEY ("nome_projeto")
);

-- CreateIndex
CREATE UNIQUE INDEX "agentes_alimentadores_ag_alimentador_nome_key" ON "agentes_alimentadores"("ag_alimentador_nome");

-- CreateIndex
CREATE UNIQUE INDEX "agentes_alimentadores_ag_alimentador_cpf_key" ON "agentes_alimentadores"("ag_alimentador_cpf");

-- CreateIndex
CREATE UNIQUE INDEX "agentes_alimentadores_ag_alimentador_cnpj_key" ON "agentes_alimentadores"("ag_alimentador_cnpj");

-- CreateIndex
CREATE UNIQUE INDEX "agentes_fiscais_ag_fiscal_nome_key" ON "agentes_fiscais"("ag_fiscal_nome");

-- CreateIndex
CREATE UNIQUE INDEX "agentes_fiscais_ag_fiscal_cpf_key" ON "agentes_fiscais"("ag_fiscal_cpf");

-- CreateIndex
CREATE UNIQUE INDEX "agentes_fiscais_ag_fiscal_cnpj_key" ON "agentes_fiscais"("ag_fiscal_cnpj");

-- AddForeignKey
ALTER TABLE "projetos" ADD CONSTRAINT "projetos_ag_fiscal_nome_fkey" FOREIGN KEY ("ag_fiscal_nome") REFERENCES "agentes_fiscais"("ag_fiscal_nome") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "projetos" ADD CONSTRAINT "projetos_ag_fiscal_cpf_fkey" FOREIGN KEY ("ag_fiscal_cpf") REFERENCES "agentes_fiscais"("ag_fiscal_cpf") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "projetos" ADD CONSTRAINT "projetos_ag_fiscal_cnpj_fkey" FOREIGN KEY ("ag_fiscal_cnpj") REFERENCES "agentes_fiscais"("ag_fiscal_cnpj") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "projetos" ADD CONSTRAINT "projetos_ag_alimentador_nome_fkey" FOREIGN KEY ("ag_alimentador_nome") REFERENCES "agentes_alimentadores"("ag_alimentador_nome") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "projetos" ADD CONSTRAINT "projetos_ag_alimentador_cpf_fkey" FOREIGN KEY ("ag_alimentador_cpf") REFERENCES "agentes_alimentadores"("ag_alimentador_cpf") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "projetos" ADD CONSTRAINT "projetos_ag_alimentador_cnpj_fkey" FOREIGN KEY ("ag_alimentador_cnpj") REFERENCES "agentes_alimentadores"("ag_alimentador_cnpj") ON DELETE RESTRICT ON UPDATE CASCADE;
