/*
  Warnings:

  - A unique constraint covering the columns `[nome_user]` on the table `users` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[cpf]` on the table `users` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[cnpj]` on the table `users` will be added. If there are existing duplicate values, this will fail.

*/
-- CreateTable
CREATE TABLE "agentes_fiscais" (
    "id_agfiscal" TEXT NOT NULL,
    "ag_fiscal_nome" TEXT NOT NULL,
    "ag_fiscal_cpf" TEXT NOT NULL,
    "ag_fiscal_cnpj" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "agentes_fiscais_pkey" PRIMARY KEY ("id_agfiscal")
);

-- CreateTable
CREATE TABLE "agentes_alimentadores" (
    "id_agalimentador" TEXT NOT NULL,
    "ag_alimentador_nome" TEXT NOT NULL,
    "ag_alimentador_cpf" TEXT NOT NULL,
    "ag_alimentador_cnpj" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "agentes_alimentadores_pkey" PRIMARY KEY ("id_agalimentador")
);

-- CreateTable
CREATE TABLE "admins" (
    "id_admin" TEXT NOT NULL,
    "admin_nome" TEXT NOT NULL,
    "admin_cpf" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "admins_pkey" PRIMARY KEY ("id_admin")
);

-- CreateIndex
CREATE UNIQUE INDEX "users_nome_user_key" ON "users"("nome_user");

-- CreateIndex
CREATE UNIQUE INDEX "users_cpf_key" ON "users"("cpf");

-- CreateIndex
CREATE UNIQUE INDEX "users_cnpj_key" ON "users"("cnpj");

-- AddForeignKey
ALTER TABLE "agentes_fiscais" ADD CONSTRAINT "agentes_fiscais_ag_fiscal_nome_fkey" FOREIGN KEY ("ag_fiscal_nome") REFERENCES "users"("nome_user") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "agentes_fiscais" ADD CONSTRAINT "agentes_fiscais_ag_fiscal_cpf_fkey" FOREIGN KEY ("ag_fiscal_cpf") REFERENCES "users"("cpf") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "agentes_fiscais" ADD CONSTRAINT "agentes_fiscais_ag_fiscal_cnpj_fkey" FOREIGN KEY ("ag_fiscal_cnpj") REFERENCES "users"("cnpj") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "agentes_alimentadores" ADD CONSTRAINT "agentes_alimentadores_ag_alimentador_nome_fkey" FOREIGN KEY ("ag_alimentador_nome") REFERENCES "users"("nome_user") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "agentes_alimentadores" ADD CONSTRAINT "agentes_alimentadores_ag_alimentador_cpf_fkey" FOREIGN KEY ("ag_alimentador_cpf") REFERENCES "users"("cpf") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "agentes_alimentadores" ADD CONSTRAINT "agentes_alimentadores_ag_alimentador_cnpj_fkey" FOREIGN KEY ("ag_alimentador_cnpj") REFERENCES "users"("cnpj") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "admins" ADD CONSTRAINT "admins_admin_nome_fkey" FOREIGN KEY ("admin_nome") REFERENCES "users"("nome_user") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "admins" ADD CONSTRAINT "admins_admin_cpf_fkey" FOREIGN KEY ("admin_cpf") REFERENCES "users"("cpf") ON DELETE RESTRICT ON UPDATE CASCADE;
