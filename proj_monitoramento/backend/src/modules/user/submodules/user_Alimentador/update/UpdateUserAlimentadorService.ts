import prismaClient from "../../../../../prisma";

class UpdateUserAlimentadorService {
  async execute(user_id: string, newData: any) {
    const user = await prismaClient.user_alimentador.findUnique({
      where: {
        id_alimentador: user_id,
      },
    });

    if (!user) {
      throw new Error("User not found");
    }

    const updatedUser = await prismaClient.user_alimentador.update({
      where: {
        id_alimentador: user_id,
      },
      data: newData, // Use os novos dados para atualizar o usuário
    });

    return updatedUser;
  }
}

export { UpdateUserAlimentadorService };
