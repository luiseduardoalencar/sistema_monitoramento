import prismaClient from "../../../../../prisma";

class UpdateUserAdminService {
  async execute(user_id: string, newData: any) {
    const user = await prismaClient.user_admin.findUnique({
      where: {
        id_admin: user_id,
      },
    });

    if (!user) {
      throw new Error("User not found");
    }

    const updatedUser = await prismaClient.user_admin.update({
      where: {
        id_admin: user_id,
      },
      data: newData, // Use os novos dados para atualizar o usuário
    });

    return updatedUser;
  }
}

export { UpdateUserAdminService };
