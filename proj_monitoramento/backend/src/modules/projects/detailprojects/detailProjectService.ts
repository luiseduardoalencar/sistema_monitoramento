import prismaClient from "../../../prisma";



class detailProjectService {
  async execute(project_id: string) {
    
    const project = await prismaClient.projetos.findFirst({
      where: {
        id_projeto: project_id,
      },
    });


    return project;
  }
}
export { detailProjectService };