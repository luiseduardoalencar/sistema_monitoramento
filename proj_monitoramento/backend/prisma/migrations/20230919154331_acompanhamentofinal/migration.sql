/*
  Warnings:

  - You are about to drop the column `cnpj_alimentador` on the `acompanhamento` table. All the data in the column will be lost.
  - You are about to drop the column `cnpj_fiscal` on the `acompanhamento` table. All the data in the column will be lost.
  - You are about to drop the column `cod_municipio` on the `acompanhamento` table. All the data in the column will be lost.
  - You are about to drop the column `cpf_alimentador` on the `acompanhamento` table. All the data in the column will be lost.
  - You are about to drop the column `cpf_fiscal` on the `acompanhamento` table. All the data in the column will be lost.
  - A unique constraint covering the columns `[id_projeto]` on the table `projetos` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[cod_unico]` on the table `projetos` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[nome_alimentador]` on the table `projetos` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[nome_fiscal]` on the table `projetos` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `cod_unico` to the `acompanhamento` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "projetos" DROP CONSTRAINT "projetos_id_alimentador_fkey";

-- DropForeignKey
ALTER TABLE "projetos" DROP CONSTRAINT "projetos_id_fiscal_fkey";

-- DropIndex
DROP INDEX "user_alimentador_id_alimentador_key";

-- DropIndex
DROP INDEX "user_fiscal_id_fiscal_key";

-- AlterTable
ALTER TABLE "acompanhamento" DROP COLUMN "cnpj_alimentador",
DROP COLUMN "cnpj_fiscal",
DROP COLUMN "cod_municipio",
DROP COLUMN "cpf_alimentador",
DROP COLUMN "cpf_fiscal",
ADD COLUMN     "cod_unico" TEXT NOT NULL;

-- CreateIndex
CREATE UNIQUE INDEX "projetos_id_projeto_key" ON "projetos"("id_projeto");

-- CreateIndex
CREATE UNIQUE INDEX "projetos_cod_unico_key" ON "projetos"("cod_unico");

-- CreateIndex
CREATE UNIQUE INDEX "projetos_nome_alimentador_key" ON "projetos"("nome_alimentador");

-- CreateIndex
CREATE UNIQUE INDEX "projetos_nome_fiscal_key" ON "projetos"("nome_fiscal");

-- AddForeignKey
ALTER TABLE "acompanhamento" ADD CONSTRAINT "acompanhamento_nome_alimentador_fkey" FOREIGN KEY ("nome_alimentador") REFERENCES "projetos"("nome_alimentador") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "acompanhamento" ADD CONSTRAINT "acompanhamento_nome_fiscal_fkey" FOREIGN KEY ("nome_fiscal") REFERENCES "projetos"("nome_fiscal") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "acompanhamento" ADD CONSTRAINT "acompanhamento_nome_projeto_fkey" FOREIGN KEY ("nome_projeto") REFERENCES "projetos"("nome_projeto") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "acompanhamento" ADD CONSTRAINT "acompanhamento_cod_unico_fkey" FOREIGN KEY ("cod_unico") REFERENCES "projetos"("cod_unico") ON DELETE RESTRICT ON UPDATE CASCADE;
