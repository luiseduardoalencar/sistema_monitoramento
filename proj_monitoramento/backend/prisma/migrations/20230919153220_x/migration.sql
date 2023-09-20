/*
  Warnings:

  - You are about to drop the column `cod_unico` on the `acompanhamento` table. All the data in the column will be lost.
  - You are about to drop the column `created_at` on the `acompanhamento` table. All the data in the column will be lost.
  - You are about to drop the column `status` on the `acompanhamento` table. All the data in the column will be lost.
  - You are about to drop the column `updated_at` on the `acompanhamento` table. All the data in the column will be lost.
  - A unique constraint covering the columns `[nome_projeto]` on the table `projetos` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[id_alimentador]` on the table `user_alimentador` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[id_fiscal]` on the table `user_fiscal` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `cnpj_alimentador` to the `acompanhamento` table without a default value. This is not possible if the table is not empty.
  - Added the required column `cnpj_fiscal` to the `acompanhamento` table without a default value. This is not possible if the table is not empty.
  - Added the required column `cod_municipio` to the `acompanhamento` table without a default value. This is not possible if the table is not empty.
  - Added the required column `cpf_alimentador` to the `acompanhamento` table without a default value. This is not possible if the table is not empty.
  - Added the required column `cpf_fiscal` to the `acompanhamento` table without a default value. This is not possible if the table is not empty.
  - Added the required column `data_inicio` to the `acompanhamento` table without a default value. This is not possible if the table is not empty.
  - Added the required column `id_projeto` to the `acompanhamento` table without a default value. This is not possible if the table is not empty.
  - Added the required column `nome_projeto` to the `acompanhamento` table without a default value. This is not possible if the table is not empty.
  - Added the required column `prazo_exec` to the `acompanhamento` table without a default value. This is not possible if the table is not empty.
  - Added the required column `id_alimentador` to the `projetos` table without a default value. This is not possible if the table is not empty.
  - Added the required column `id_fiscal` to the `projetos` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "acompanhamento" DROP CONSTRAINT "acompanhamento_cod_unico_fkey";

-- DropForeignKey
ALTER TABLE "acompanhamento" DROP CONSTRAINT "acompanhamento_nome_alimentador_fkey";

-- DropForeignKey
ALTER TABLE "acompanhamento" DROP CONSTRAINT "acompanhamento_nome_fiscal_fkey";

-- DropIndex
DROP INDEX "projetos_cod_unico_key";

-- DropIndex
DROP INDEX "projetos_nome_alimentador_key";

-- DropIndex
DROP INDEX "projetos_nome_fiscal_key";

-- AlterTable
ALTER TABLE "acompanhamento" DROP COLUMN "cod_unico",
DROP COLUMN "created_at",
DROP COLUMN "status",
DROP COLUMN "updated_at",
ADD COLUMN     "cnpj_alimentador" TEXT NOT NULL,
ADD COLUMN     "cnpj_fiscal" TEXT NOT NULL,
ADD COLUMN     "cod_municipio" TEXT NOT NULL,
ADD COLUMN     "cpf_alimentador" TEXT NOT NULL,
ADD COLUMN     "cpf_fiscal" TEXT NOT NULL,
ADD COLUMN     "data_inicio" TEXT NOT NULL,
ADD COLUMN     "id_projeto" TEXT NOT NULL,
ADD COLUMN     "nome_projeto" TEXT NOT NULL,
ADD COLUMN     "prazo_exec" TEXT NOT NULL;

-- AlterTable
ALTER TABLE "projetos" ADD COLUMN     "id_alimentador" TEXT NOT NULL,
ADD COLUMN     "id_fiscal" TEXT NOT NULL;

-- CreateIndex
CREATE UNIQUE INDEX "projetos_nome_projeto_key" ON "projetos"("nome_projeto");

-- CreateIndex
CREATE UNIQUE INDEX "user_alimentador_id_alimentador_key" ON "user_alimentador"("id_alimentador");

-- CreateIndex
CREATE UNIQUE INDEX "user_fiscal_id_fiscal_key" ON "user_fiscal"("id_fiscal");

-- AddForeignKey
ALTER TABLE "projetos" ADD CONSTRAINT "projetos_id_fiscal_fkey" FOREIGN KEY ("id_fiscal") REFERENCES "user_fiscal"("id_fiscal") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "projetos" ADD CONSTRAINT "projetos_id_alimentador_fkey" FOREIGN KEY ("id_alimentador") REFERENCES "user_alimentador"("id_alimentador") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "acompanhamento" ADD CONSTRAINT "acompanhamento_id_projeto_fkey" FOREIGN KEY ("id_projeto") REFERENCES "projetos"("id_projeto") ON DELETE RESTRICT ON UPDATE CASCADE;
