import { Injectable } from '@nestjs/common';
import { RegisterDto } from './dto';

@Injectable()
export class AuthService {
  constructor() {}

  async registerLocal(registerDto: RegisterDto) {
    return registerDto;
  }
}
