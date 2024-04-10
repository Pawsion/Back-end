import { Body, Controller, Post } from '@nestjs/common';
import { AuthService } from './auth.service';
import { RegisterDto } from './dto';

@Controller('auth')
export class AuthController {
  constructor(private readonly authService: AuthService) {}

  @Post('register')
  async registerLocal(@Body() registerDto: RegisterDto) {
    return await this.authService.registerLocal(registerDto);
  }
}
