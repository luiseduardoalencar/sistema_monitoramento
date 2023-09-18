/*
  Warnings:

  - You are about to drop the column `cnae` on the `projetos` table. All the data in the column will be lost.
  - You are about to drop the column `cod_ibge` on the `projetos` table. All the data in the column will be lost.
  - Added the required column `cod_cnae_divisao` to the `projetos` table without a default value. This is not possible if the table is not empty.
  - Added the required column `cod_cnae_secao` to the `projetos` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "projetos" DROP COLUMN "cnae",
DROP COLUMN "cod_ibge",
ADD COLUMN     "cod_cnae_divisao" TEXT NOT NULL,
ADD COLUMN     "cod_cnae_secao" TEXT NOT NULL;

-- CreateTable
CREATE TABLE "codigo_ibge" (
    "id_codig_ibge" TEXT NOT NULL,
    "uf" TEXT NOT NULL,
    "cod_municipio" TEXT NOT NULL,
    "nome_municipio" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "codigo_ibge_pkey" PRIMARY KEY ("id_codig_ibge")
);

-- CreateTable
CREATE TABLE "codigo_unico" (
    "id_cod_unico" TEXT NOT NULL,
    "cod_municipio" TEXT NOT NULL,
    "cod_unico" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "codigo_unico_pkey" PRIMARY KEY ("id_cod_unico")
);

-- CreateTable
CREATE TABLE "cnae" (
    "id_cnae" TEXT NOT NULL,
    "cod_cnae_secao" TEXT NOT NULL,
    "cod_cnae_divisao" TEXT NOT NULL,
    "descricao_cnae" TEXT NOT NULL,

    CONSTRAINT "cnae_pkey" PRIMARY KEY ("id_cnae")
);

-- CreateIndex
CREATE UNIQUE INDEX "codigo_ibge_cod_municipio_key" ON "codigo_ibge"("cod_municipio");

-- CreateIndex
CREATE UNIQUE INDEX "codigo_unico_cod_unico_key" ON "codigo_unico"("cod_unico");

-- CreateIndex
CREATE UNIQUE INDEX "cnae_cod_cnae_secao_key" ON "cnae"("cod_cnae_secao");

-- CreateIndex
CREATE UNIQUE INDEX "cnae_cod_cnae_divisao_key" ON "cnae"("cod_cnae_divisao");

-- AddForeignKey
ALTER TABLE "codigo_unico" ADD CONSTRAINT "codigo_unico_cod_municipio_fkey" FOREIGN KEY ("cod_municipio") REFERENCES "codigo_ibge"("cod_municipio") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "projetos" ADD CONSTRAINT "projetos_cod_unico_fkey" FOREIGN KEY ("cod_unico") REFERENCES "codigo_unico"("cod_unico") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "projetos" ADD CONSTRAINT "projetos_cod_cnae_secao_fkey" FOREIGN KEY ("cod_cnae_secao") REFERENCES "cnae"("cod_cnae_secao") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "projetos" ADD CONSTRAINT "projetos_cod_cnae_divisao_fkey" FOREIGN KEY ("cod_cnae_divisao") REFERENCES "cnae"("cod_cnae_divisao") ON DELETE RESTRICT ON UPDATE CASCADE;
