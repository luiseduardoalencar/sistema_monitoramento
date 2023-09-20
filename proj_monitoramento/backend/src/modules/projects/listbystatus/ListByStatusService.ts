import prismaClient from "../../../prisma";

interface ProductRequest{
    status: string;
}

class ListByStatusService {
  async execute({status}: ProductRequest) {
    const projects = await prismaClient.projetos.findMany({
      where: {
        status: status,
      },
    });

    return projects;
  }
}

export { ListByStatusService };