-- CreateTable
CREATE TABLE "users" (
    "id" TEXT NOT NULL,
    "nome_user" TEXT NOT NULL,
    "nome_orgao" TEXT NOT NULL,
    "cargo" TEXT NOT NULL,
    "profissao" TEXT NOT NULL,
    "nivel_escolaridade" TEXT NOT NULL,
    "sexo" TEXT NOT NULL,
    "genero" TEXT NOT NULL,
    "cpf" TEXT NOT NULL,
    "mat_orgao" TEXT NOT NULL,
    "unidade_sei" TEXT NOT NULL,
    "email_institucional" TEXT NOT NULL,
    "email_pessoal" TEXT NOT NULL,
    "cnpj" TEXT NOT NULL,
    "nome_empresa" TEXT NOT NULL,
    "num_contrato" TEXT NOT NULL,
    "nivel_acesso" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "users_pkey" PRIMARY KEY ("id")
);
