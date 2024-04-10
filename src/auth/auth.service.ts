import { Injectable } from '@nestjs/common';
import { LoginDto, RegisterDto } from './dto';

@Injectable()
export class AuthService {
  constructor() {}

  async registerLocal(registerDto: RegisterDto) {
    // TODO
    return registerDto;
  }

  async loginLocal(loginDto: LoginDto) {
    // TODO
    return loginDto;
  }

  async logout() {
    // TODO
    return 0;
  }

  async refreshToken() {
    // TODO
    return 0;
  }
}
