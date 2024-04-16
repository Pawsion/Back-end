import { Body, Controller, Post } from '@nestjs/common';
import { AuthService } from './auth.service';
import { LoginDto, RegisterDto } from './dto';

@Controller('auth')
export class AuthController {
  constructor(private readonly authService: AuthService) {}

  @Post('register')
  async registerLocal(@Body() registerDto: RegisterDto) {
    return await this.authService.registerLocal(registerDto);
  }
  @Post('login')
  async loginLocal(@Body() loginDto: LoginDto) {
    return await this.authService.loginLocal(loginDto);
  }

  @Post('logout')
  async logoutLocal() {
    return await this.authService.logOut(1);
  }

  @Post('refresh')
  async refreshTokens() {
    return await this.authService.refreshTokens(1, 'refreshToken');
  }
}
