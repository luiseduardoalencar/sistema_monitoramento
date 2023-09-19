/*
  Warnings:

  - Added the required column `ano_execucao` to the `codigo_unico` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "codigo_unico" ADD COLUMN     "ano_execucao" TEXT NOT NULL,
ADD COLUMN     "ordem_execucao" SERIAL NOT NULL;
