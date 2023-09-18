/*
  Warnings:

  - The primary key for the `codigo_ibge` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `id_codig_ibge` on the `codigo_ibge` table. All the data in the column will be lost.
  - Added the required column `nome_uf` to the `codigo_ibge` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "codigo_ibge" DROP CONSTRAINT "codigo_ibge_pkey",
DROP COLUMN "id_codig_ibge",
ADD COLUMN     "id_codigo_ibge" SERIAL NOT NULL,
ADD COLUMN     "nome_uf" TEXT NOT NULL,
ADD CONSTRAINT "codigo_ibge_pkey" PRIMARY KEY ("id_codigo_ibge");
