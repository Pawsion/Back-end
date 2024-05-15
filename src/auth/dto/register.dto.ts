import {
  IsEmail,
  IsNotEmpty,
  IsString,
  MaxLength,
  MinLength,
} from 'class-validator';

export class RegisterDto {
  // TODO -> create proper DTO to match the database

  // idUser      Int           @id @default(autoincrement())
  // firstName   String        @db.VarChar(45)
  // lastName    String        @db.VarChar(45)
  // phoneNumber String        @db.VarChar(45)
  // email       String        @db.VarChar(45)
  // // TODO String? ?????? Also check if 45 is limit
  // password    String?       @db.VarChar(45)
  // pet         pet[]
  // reservation reservation[]
  // review      review[]
  @IsString()
  @IsNotEmpty()
  @MinLength(4)
  @MaxLength(30)
  readonly firstName: string;

  @IsString()
  @IsNotEmpty()
  @MinLength(4)
  @MaxLength(30)
  readonly lastName: string;

  @IsString()
  @IsNotEmpty()
  @MinLength(4)
  @MaxLength(30)
  readonly phoneNumber: string;

  @IsEmail()
  @MaxLength(30)
  @IsNotEmpty()
  readonly email: string;

  @IsString()
  @MinLength(6)
  password: string;
}
