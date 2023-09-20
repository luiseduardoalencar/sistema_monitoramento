/*
  Warnings:

  - You are about to drop the column `id_alimentador` on the `projetos` table. All the data in the column will be lost.
  - You are about to drop the column `id_fiscal` on the `projetos` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE "projetos" DROP COLUMN "id_alimentador",
DROP COLUMN "id_fiscal";
