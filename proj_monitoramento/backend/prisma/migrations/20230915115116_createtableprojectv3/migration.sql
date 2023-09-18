/*
  Warnings:

  - The primary key for the `projetos` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The required column `id_projeto` was added to the `projetos` table with a prisma-level default value. This is not possible if the table is not empty. Please add this column as optional, then populate it before making it required.

*/
-- AlterTable
ALTER TABLE "projetos" DROP CONSTRAINT "projetos_pkey",
ADD COLUMN     "id_projeto" TEXT NOT NULL,
ADD CONSTRAINT "projetos_pkey" PRIMARY KEY ("id_projeto");
