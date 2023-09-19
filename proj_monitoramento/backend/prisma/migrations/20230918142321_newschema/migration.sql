/*
  Warnings:

  - You are about to drop the `codigo_unico` table. If the table is not empty, all the data it contains will be lost.
  - Added the required column `ano_exec` to the `projetos` table without a default value. This is not possible if the table is not empty.
  - Added the required column `cod_municipio` to the `projetos` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "projetos" DROP CONSTRAINT "projetos_cod_unico_fkey";

-- AlterTable
ALTER TABLE "projetos" ADD COLUMN     "ano_exec" TEXT NOT NULL,
ADD COLUMN     "cod_municipio" TEXT NOT NULL,
ADD COLUMN     "ordem_servico" SERIAL NOT NULL;

-- DropTable
DROP TABLE "codigo_unico";
