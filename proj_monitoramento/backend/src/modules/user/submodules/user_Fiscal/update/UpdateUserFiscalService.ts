import prismaClient from "../../../../../prisma";

class UpdateUserFiscalService {
  async execute(user_id: string, newData: any) {
    const user = await prismaClient.user_fiscal.findUnique({
      where: {
        id_fiscal: user_id,
      },
    });

    if (!user) {
      throw new Error("User not found");
    }

    const updatedUser = await prismaClient.user_fiscal.update({
      where: {
        id_fiscal: user_id,
      },
      data: newData, // Use os novos dados para atualizar o usuário
    });

    return updatedUser;
  }
}

export { UpdateUserFiscalService };
