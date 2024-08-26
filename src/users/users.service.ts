import { HttpException, Injectable } from '@nestjs/common';
import { CreateUserDto } from './dto/create-user.dto';
import { UpdateUserDto } from './dto/update-user.dto';
import { PrismaService } from 'src/prisma/prisma.service';

@Injectable()
export class UsersService {
  constructor(
    private prisma: PrismaService
  ) {}

  async create(
    createUserDto: CreateUserDto,
  ) {
    const userData =
      await this.prisma.user.create(
      {
        data: createUserDto
      }
      );
    return userData;
  }

  async findAll() {
    return await this.prisma.user.findMany();
  }

  async findOne(id: number) {
    const userData =
      await this.prisma.user.findFirst({where: {id: id} });
    if (!userData) {
      throw new HttpException(
        'User Not Found',
        404,
      );
    }
    return userData;
  }

  async update(
    id: number,
    updateUserDto: UpdateUserDto,
  ) {
    const existingUser = await this.findOne(id);
    return await this.prisma.user.update({
      where: {
        id: existingUser.id
      },
      data: updateUserDto
    });
  }

  async remove(id: number){
    const existingUser = await this.findOne(id);
    return await this.prisma.user.delete({
      where: {
        id: existingUser.id
      }
    }
    );
  }
}