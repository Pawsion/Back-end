import { Injectable } from '@nestjs/common';
import { PrismaService } from 'src/prisma/prisma.service';

@Injectable()
export class BlogsService {
constructor(private prisma: PrismaService) {}

  async createText(content: string) {
    return this.prisma.blog.create({
      data: { content },
    });
  }

  async getAllTexts() {
    return this.prisma.blog.findMany();
  }
}
