import { Injectable } from '@nestjs/common';
import { PrismaService } from 'src/prisma/prisma.service';
import { Prisma } from '@prisma/client';

@Injectable()
export class PetHotelService {
  constructor(private prisma: PrismaService) {}

  async create(data: Prisma.pethotelCreateInput) {
    return this.prisma.pethotel.create({
      data,
    });
  }

  async findAll() {
    return this.prisma.pethotel.findMany();
  }

  async findOne(id: number) {
    return this.prisma.pethotel.findUnique({
      where: { id },
    });
  }

  async update(id: number, data: Prisma.pethotelUpdateInput) {
    return this.prisma.pethotel.update({
      where: { id },
      data,
    });
  }

  async remove(id: number) {
    return this.prisma.pethotel.delete({
      where: { id },
    });
  }
}
