/*
  Warnings:

  - A unique constraint covering the columns `[cod_unico]` on the table `projetos` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[nome_alimentador]` on the table `projetos` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[nome_fiscal]` on the table `projetos` will be added. If there are existing duplicate values, this will fail.

*/
-- CreateTable
CREATE TABLE "acompanhamento" (
    "id_acompanhamento" TEXT NOT NULL,
    "cod_unico" TEXT NOT NULL,
    "status" TEXT NOT NULL,
    "nome_alimentador" TEXT NOT NULL,
    "nome_fiscal" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "acompanhamento_pkey" PRIMARY KEY ("id_acompanhamento")
);

-- CreateIndex
CREATE UNIQUE INDEX "projetos_cod_unico_key" ON "projetos"("cod_unico");

-- CreateIndex
CREATE UNIQUE INDEX "projetos_nome_alimentador_key" ON "projetos"("nome_alimentador");

-- CreateIndex
CREATE UNIQUE INDEX "projetos_nome_fiscal_key" ON "projetos"("nome_fiscal");

-- AddForeignKey
ALTER TABLE "acompanhamento" ADD CONSTRAINT "acompanhamento_cod_unico_fkey" FOREIGN KEY ("cod_unico") REFERENCES "projetos"("cod_unico") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "acompanhamento" ADD CONSTRAINT "acompanhamento_nome_alimentador_fkey" FOREIGN KEY ("nome_alimentador") REFERENCES "projetos"("nome_alimentador") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "acompanhamento" ADD CONSTRAINT "acompanhamento_nome_fiscal_fkey" FOREIGN KEY ("nome_fiscal") REFERENCES "projetos"("nome_fiscal") ON DELETE RESTRICT ON UPDATE CASCADE;
