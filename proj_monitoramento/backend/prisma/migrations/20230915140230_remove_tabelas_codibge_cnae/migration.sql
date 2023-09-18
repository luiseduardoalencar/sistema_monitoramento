/*
  Warnings:

  - The primary key for the `codigo_unico` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `id_cod_unico` on the `codigo_unico` table. All the data in the column will be lost.
  - You are about to drop the `cnae` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `codigo_ibge` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "codigo_unico" DROP CONSTRAINT "codigo_unico_cod_municipio_fkey";

-- DropForeignKey
ALTER TABLE "projetos" DROP CONSTRAINT "projetos_cod_cnae_divisao_fkey";

-- DropForeignKey
ALTER TABLE "projetos" DROP CONSTRAINT "projetos_cod_cnae_secao_fkey";

-- AlterTable
ALTER TABLE "codigo_unico" DROP CONSTRAINT "codigo_unico_pkey",
DROP COLUMN "id_cod_unico",
ADD COLUMN     "id_codigo_unico" SERIAL NOT NULL,
ADD CONSTRAINT "codigo_unico_pkey" PRIMARY KEY ("id_codigo_unico");

-- DropTable
DROP TABLE "cnae";

-- DropTable
DROP TABLE "codigo_ibge";
