/*
  Warnings:

  - The primary key for the `user_alimentador` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `id` on the `user_alimentador` table. All the data in the column will be lost.
  - The required column `id_alimentador` was added to the `user_alimentador` table with a prisma-level default value. This is not possible if the table is not empty. Please add this column as optional, then populate it before making it required.

*/
-- AlterTable
ALTER TABLE "user_alimentador" DROP CONSTRAINT "user_alimentador_pkey",
DROP COLUMN "id",
ADD COLUMN     "id_alimentador" TEXT NOT NULL,
ADD CONSTRAINT "user_alimentador_pkey" PRIMARY KEY ("id_alimentador");
