/*
  Warnings:

  - You are about to drop the column `ag_alimentador_cnpj` on the `projetos` table. All the data in the column will be lost.
  - You are about to drop the column `ag_alimentador_cpf` on the `projetos` table. All the data in the column will be lost.
  - You are about to drop the column `ag_alimentador_nome` on the `projetos` table. All the data in the column will be lost.
  - You are about to drop the column `ag_fiscal_cnpj` on the `projetos` table. All the data in the column will be lost.
  - You are about to drop the column `ag_fiscal_cpf` on the `projetos` table. All the data in the column will be lost.
  - You are about to drop the column `ag_fiscal_nome` on the `projetos` table. All the data in the column will be lost.
  - You are about to drop the `admins` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `agentes_alimentadores` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `agentes_fiscais` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `users` table. If the table is not empty, all the data it contains will be lost.
  - Added the required column `cnpj_alimentador` to the `projetos` table without a default value. This is not possible if the table is not empty.
  - Added the required column `cnpj_fiscal` to the `projetos` table without a default value. This is not possible if the table is not empty.
  - Added the required column `cpf_alimentador` to the `projetos` table without a default value. This is not possible if the table is not empty.
  - Added the required column `cpf_fiscal` to the `projetos` table without a default value. This is not possible if the table is not empty.
  - Added the required column `nome_alimentador` to the `projetos` table without a default value. This is not possible if the table is not empty.
  - Added the required column `nome_fiscal` to the `projetos` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "admins" DROP CONSTRAINT "admins_admin_cpf_fkey";

-- DropForeignKey
ALTER TABLE "admins" DROP CONSTRAINT "admins_admin_nome_fkey";

-- DropForeignKey
ALTER TABLE "agentes_alimentadores" DROP CONSTRAINT "agentes_alimentadores_ag_alimentador_cnpj_fkey";

-- DropForeignKey
ALTER TABLE "agentes_alimentadores" DROP CONSTRAINT "agentes_alimentadores_ag_alimentador_cpf_fkey";

-- DropForeignKey
ALTER TABLE "agentes_alimentadores" DROP CONSTRAINT "agentes_alimentadores_ag_alimentador_nome_fkey";

-- DropForeignKey
ALTER TABLE "agentes_fiscais" DROP CONSTRAINT "agentes_fiscais_ag_fiscal_cnpj_fkey";

-- DropForeignKey
ALTER TABLE "agentes_fiscais" DROP CONSTRAINT "agentes_fiscais_ag_fiscal_cpf_fkey";

-- DropForeignKey
ALTER TABLE "agentes_fiscais" DROP CONSTRAINT "agentes_fiscais_ag_fiscal_nome_fkey";

-- DropForeignKey
ALTER TABLE "projetos" DROP CONSTRAINT "projetos_ag_alimentador_cnpj_fkey";

-- DropForeignKey
ALTER TABLE "projetos" DROP CONSTRAINT "projetos_ag_alimentador_cpf_fkey";

-- DropForeignKey
ALTER TABLE "projetos" DROP CONSTRAINT "projetos_ag_alimentador_nome_fkey";

-- DropForeignKey
ALTER TABLE "projetos" DROP CONSTRAINT "projetos_ag_fiscal_cnpj_fkey";

-- DropForeignKey
ALTER TABLE "projetos" DROP CONSTRAINT "projetos_ag_fiscal_cpf_fkey";

-- DropForeignKey
ALTER TABLE "projetos" DROP CONSTRAINT "projetos_ag_fiscal_nome_fkey";

-- AlterTable
ALTER TABLE "projetos" DROP COLUMN "ag_alimentador_cnpj",
DROP COLUMN "ag_alimentador_cpf",
DROP COLUMN "ag_alimentador_nome",
DROP COLUMN "ag_fiscal_cnpj",
DROP COLUMN "ag_fiscal_cpf",
DROP COLUMN "ag_fiscal_nome",
ADD COLUMN     "cnpj_alimentador" TEXT NOT NULL,
ADD COLUMN     "cnpj_fiscal" TEXT NOT NULL,
ADD COLUMN     "cpf_alimentador" TEXT NOT NULL,
ADD COLUMN     "cpf_fiscal" TEXT NOT NULL,
ADD COLUMN     "nome_alimentador" TEXT NOT NULL,
ADD COLUMN     "nome_fiscal" TEXT NOT NULL;

-- DropTable
DROP TABLE "admins";

-- DropTable
DROP TABLE "agentes_alimentadores";

-- DropTable
DROP TABLE "agentes_fiscais";

-- DropTable
DROP TABLE "users";

-- CreateTable
CREATE TABLE "user_admin" (
    "id_admin" TEXT NOT NULL,
    "nome_admin" TEXT NOT NULL,
    "nome_orgao" TEXT NOT NULL,
    "cargo" TEXT NOT NULL,
    "profissao" TEXT NOT NULL,
    "nivel_escolaridade" TEXT NOT NULL,
    "sexo" TEXT NOT NULL,
    "genero" TEXT NOT NULL,
    "cpf_admin" TEXT NOT NULL,
    "mat_orgao" TEXT NOT NULL,
    "unidade_sei" TEXT NOT NULL,
    "email_institucional" TEXT NOT NULL,
    "email_pessoal" TEXT NOT NULL,
    "cnpj" TEXT NOT NULL,
    "nome_empresa" TEXT NOT NULL,
    "num_contrato" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "user_admin_pkey" PRIMARY KEY ("id_admin")
);

-- CreateTable
CREATE TABLE "user_fiscal" (
    "id_fiscal" TEXT NOT NULL,
    "nome_fiscal" TEXT NOT NULL,
    "nome_orgao" TEXT NOT NULL,
    "cargo" TEXT NOT NULL,
    "profissao" TEXT NOT NULL,
    "nivel_escolaridade" TEXT NOT NULL,
    "sexo" TEXT NOT NULL,
    "genero" TEXT NOT NULL,
    "cpf_fiscal" TEXT NOT NULL,
    "mat_orgao" TEXT NOT NULL,
    "unidade_sei" TEXT NOT NULL,
    "email_institucional" TEXT NOT NULL,
    "email_pessoal" TEXT NOT NULL,
    "cnpj_fiscal" TEXT NOT NULL,
    "nome_empresa" TEXT NOT NULL,
    "num_contrato" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "user_fiscal_pkey" PRIMARY KEY ("id_fiscal")
);

-- CreateTable
CREATE TABLE "user_alimentador" (
    "id" TEXT NOT NULL,
    "nome_alimentador" TEXT NOT NULL,
    "nome_orgao" TEXT NOT NULL,
    "cargo" TEXT NOT NULL,
    "profissao" TEXT NOT NULL,
    "nivel_escolaridade" TEXT NOT NULL,
    "sexo" TEXT NOT NULL,
    "genero" TEXT NOT NULL,
    "cpf_alimentador" TEXT NOT NULL,
    "mat_orgao" TEXT NOT NULL,
    "unidade_sei" TEXT NOT NULL,
    "email_institucional" TEXT NOT NULL,
    "email_pessoal" TEXT NOT NULL,
    "cnpj_alimentador" TEXT NOT NULL,
    "nome_empresa" TEXT NOT NULL,
    "num_contrato" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "user_alimentador_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "user_fiscal_nome_fiscal_key" ON "user_fiscal"("nome_fiscal");

-- CreateIndex
CREATE UNIQUE INDEX "user_fiscal_cpf_fiscal_key" ON "user_fiscal"("cpf_fiscal");

-- CreateIndex
CREATE UNIQUE INDEX "user_fiscal_cnpj_fiscal_key" ON "user_fiscal"("cnpj_fiscal");

-- CreateIndex
CREATE UNIQUE INDEX "user_alimentador_nome_alimentador_key" ON "user_alimentador"("nome_alimentador");

-- CreateIndex
CREATE UNIQUE INDEX "user_alimentador_cpf_alimentador_key" ON "user_alimentador"("cpf_alimentador");

-- CreateIndex
CREATE UNIQUE INDEX "user_alimentador_cnpj_alimentador_key" ON "user_alimentador"("cnpj_alimentador");

-- AddForeignKey
ALTER TABLE "projetos" ADD CONSTRAINT "projetos_nome_fiscal_fkey" FOREIGN KEY ("nome_fiscal") REFERENCES "user_fiscal"("nome_fiscal") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "projetos" ADD CONSTRAINT "projetos_cpf_fiscal_fkey" FOREIGN KEY ("cpf_fiscal") REFERENCES "user_fiscal"("cpf_fiscal") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "projetos" ADD CONSTRAINT "projetos_cnpj_fiscal_fkey" FOREIGN KEY ("cnpj_fiscal") REFERENCES "user_fiscal"("cnpj_fiscal") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "projetos" ADD CONSTRAINT "projetos_nome_alimentador_fkey" FOREIGN KEY ("nome_alimentador") REFERENCES "user_alimentador"("nome_alimentador") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "projetos" ADD CONSTRAINT "projetos_cpf_alimentador_fkey" FOREIGN KEY ("cpf_alimentador") REFERENCES "user_alimentador"("cpf_alimentador") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "projetos" ADD CONSTRAINT "projetos_cnpj_alimentador_fkey" FOREIGN KEY ("cnpj_alimentador") REFERENCES "user_alimentador"("cnpj_alimentador") ON DELETE RESTRICT ON UPDATE CASCADE;
