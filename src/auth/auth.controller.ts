import {
  Body,
  Controller,
  Get,
  HttpCode,
  HttpStatus,
  Post,
  Req,
  UseGuards,
} from '@nestjs/common';
import { AuthService } from './auth.service';
import { LoginDto, RegisterDto } from './dto';
import {
  GetCurrentUser,
  GetCurrentUserId,
  Public,
} from 'src/shared/decorators';
import { RtGuard } from 'src/shared/guards';
import { AuthGuard } from '@nestjs/passport';

@Controller('auth')
export class AuthController {
  constructor(private readonly authService: AuthService) {}

  @Public()
  @Get('google')
  @UseGuards(AuthGuard('google'))
  async googleAuth(@Req() req) {}

  @Public()
  @Get('redirect')
  @UseGuards(AuthGuard('google'))
  googleAuthRedirect(@Req() req) {
    return this.authService.googleLogin(req)
  }

  @Public()
  @Post('local/register')
  async registerLocal(@Body() registerDto: RegisterDto) {
    return await this.authService.registerLocal(registerDto);
  }

  // TODO change response ???
  @Public()
  @HttpCode(HttpStatus.OK)
  @Post('local/login')
  async loginLocal(@Body() loginDto: LoginDto) {
    return await this.authService.loginLocal(loginDto);
  }

  @HttpCode(HttpStatus.OK)
  @Post('local/logOut')
  async logoutLocal(@GetCurrentUserId() userId: number) {
    return await this.authService.logOut(userId);
  }

  @Public()
  @UseGuards(RtGuard)
  @HttpCode(HttpStatus.OK)
  @Post('refresh')
  async refreshTokens(
    @GetCurrentUserId() userId: number,
    @GetCurrentUser('refreshToken') refreshToken: string,
  ) {
    return await this.authService.refreshTokens(userId, refreshToken);
  }
}
