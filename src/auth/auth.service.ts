import { ForbiddenException, Injectable } from '@nestjs/common';
import { LoginDto, RegisterDto } from './dto';
import * as bcrypt from 'bcrypt';
import { PrismaService } from 'src/prisma/prisma.service';
import { Tokens } from './utils/types';
import { JwtService } from '@nestjs/jwt';

@Injectable()
export class AuthService {
  constructor(
    private prisma: PrismaService,
    private readonly jwtService: JwtService,
  ) {}

  async registerLocal(registerDto: RegisterDto) {
    // TODO
    const { password, email, firstName, lastName, phoneNumber } = registerDto;
    const hash = await this.hashData(password);
    console.log(registerDto);
    const newUser = await this.prisma.user.create({
      data: {
        firstName,
        lastName,
        phoneNumber,
        email,
        password: hash,
      },
    });

    const tokens = await this.getTokens(
      newUser.id,
      newUser.email,
      // newUser.role,
    );
    await this.updateRtHash(newUser.id, tokens.refreshToken);
    return tokens;
  }

  async loginLocal(loginDto: LoginDto) {
    // TODO
    const { email, password } = loginDto;
    const user = await this.prisma.user.findUnique({
      where: {
        email,
      },
    });

    if (!user) throw new ForbiddenException(`Email ${email} does not exist!`);

    const passwordMatches = await bcrypt.compare(password, user.password);

    // ! In reality it is always wrong password,
    // ! but it could be that user inserted good password but for wrong email
    if (!passwordMatches)
      throw new ForbiddenException('Wrong email or password!');

    const tokens = await this.getTokens(user.id, user.email);
    await this.updateRtHash(user.id, tokens.refreshToken);
    return tokens;
  }
  
  googleLogin(req) {
    if (!req.user) {
      return 'No user from google'
    }

    return {
      message: 'User information from google',
      user: req.user
    }
  }

  async logOut(id: number) {
    // ! updateMany so i can pass in hashedRt not null and prevent logout spam
    await this.prisma.user.updateMany({
      where: {
        id: id,
        hashedRt: { not: null },
      },
      data: { hashedRt: null },
    });
  }

  async refreshTokens(id: number, refreshToken: string) {
    const user = await this.prisma.user.findUnique({ where: { id: id } });

    if (!user) throw new ForbiddenException(`No user with ID ${id} !`);
    if (!user.hashedRt)
      throw new ForbiddenException(`User is compromised! No tokens!`);

    const rtMatches = await bcrypt.compare(refreshToken, user.hashedRt);

    if (!rtMatches)
      throw new ForbiddenException('You do not have valid credentials!');

    const tokens = await this.getTokens(user.id, user.email);
    await this.updateRtHash(user.id, tokens.refreshToken);
    return tokens;
  }

  async updateRtHash(id: number, rt: string) {
    const hash = await this.hashData(rt);
    await this.prisma.user.update({
      where: {
        id: id,
      },
      data: {
        hashedRt: hash,
      },
    });
  }

  async getTokens(
    userId: number,
    email: string,
    // TODO check type
    // role: 'USER' | 'ADMIN',
  ): Promise<Tokens> {
    const [at, rt] = await Promise.all([
      this.jwtService.signAsync(
        {
          sub: userId,
          email,
          // role,
        },
        {
          secret: process.env.AT_SECRET,
          // 3h
          expiresIn: 60 * 60 * 3,
        },
      ),
      this.jwtService.signAsync(
        {
          sub: userId,
          email,
          // role,
        },
        {
          secret: process.env.RT_SECRET,
          // 7days
          expiresIn: 60 * 60 * 24 * 7,
        },
      ),
    ]);

    return {
      accessToken: at,
      refreshToken: rt,
    };
  }

  async hashData(data: string) {
    return bcrypt.hash(data, 10);
  }
}
