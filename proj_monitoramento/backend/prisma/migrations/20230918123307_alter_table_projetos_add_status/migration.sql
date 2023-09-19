/*
  Warnings:

  - Added the required column `status` to the `projetos` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "projetos" ADD COLUMN     "status" TEXT NOT NULL;
