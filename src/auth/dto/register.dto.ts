import {
  IsEmail,
  IsNotEmpty,
  IsString,
  MaxLength,
  MinLength,
} from 'class-validator';

export class RegisterDto {
  // TODO -> create proper DTO to match the database
  @IsString()
  @IsNotEmpty()
  @MinLength(4)
  @MaxLength(30)
  readonly username: string;

  @IsEmail()
  @MaxLength(30)
  @IsNotEmpty()
  readonly email: string;

  @IsString()
  @MinLength(6)
  password: string;
}
