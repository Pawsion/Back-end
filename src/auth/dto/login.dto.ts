import { IsNotEmpty, IsString, MaxLength, MinLength } from 'class-validator';

export class LoginDto {
  @IsString()
  @MinLength(4)
  @MaxLength(30)
  @IsNotEmpty()
  readonly username: string;

  @IsString()
  @MinLength(6)
  @IsNotEmpty()
  password: string;
}
