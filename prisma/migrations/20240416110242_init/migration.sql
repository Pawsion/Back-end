-- CreateTable
CREATE TABLE `pet` (
    `idPet` INTEGER NOT NULL,
    `name` VARCHAR(45) NOT NULL,
    `type` VARCHAR(45) NOT NULL,
    `breed` VARCHAR(45) NOT NULL,
    `age` INTEGER NOT NULL,
    `gender` VARCHAR(45) NOT NULL,
    `veterinaryContact` VARCHAR(45) NOT NULL,
    `User_idUser` INTEGER NOT NULL,
    `information` JSON NOT NULL,

    INDEX `fk_Pet_User_idx`(`User_idUser`),
    PRIMARY KEY (`idPet`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `pethotel` (
    `idPetHotel` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL,
    `phoneNumber` VARCHAR(20) NOT NULL,
    `email` VARCHAR(255) NOT NULL,
    `location` VARCHAR(255) NOT NULL,
    `workingHours` VARCHAR(255) NOT NULL,

    PRIMARY KEY (`idPetHotel`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `reservation` (
    `idReservation` INTEGER NOT NULL,
    `startDate` DATE NULL,
    `endDate` DATE NULL,
    `status` TINYINT NULL,
    `Pet_idPet` INTEGER NOT NULL,
    `User_idUser` INTEGER NOT NULL,
    `PetHotel_idPetHotel` INTEGER NOT NULL,

    INDEX `fk_Reservation_Pet1_idx`(`Pet_idPet`),
    INDEX `fk_Reservation_PetHotel1_idx`(`PetHotel_idPetHotel`),
    INDEX `fk_Reservation_User1_idx`(`User_idUser`),
    PRIMARY KEY (`idReservation`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `review` (
    `idReview` INTEGER NOT NULL AUTO_INCREMENT,
    `rating` INTEGER NOT NULL,
    `comment` VARCHAR(255) NULL,
    `date` DATE NOT NULL,
    `User_idUser` INTEGER NOT NULL,
    `PetHotel_idPetHotel` INTEGER NOT NULL,

    INDEX `fk_Review_PetHotel1_idx`(`PetHotel_idPetHotel`),
    INDEX `fk_Review_User1_idx`(`User_idUser`),
    PRIMARY KEY (`idReview`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `term` (
    `idTerm` INTEGER NOT NULL AUTO_INCREMENT,
    `admissionDate` DATE NOT NULL,
    `releaseDate` DATE NOT NULL,
    `PetHotel_idPetHotel` INTEGER NOT NULL,
    `price` DECIMAL(10, 0) NOT NULL,

    INDEX `fk_Term_PetHotel1_idx`(`PetHotel_idPetHotel`),
    PRIMARY KEY (`idTerm`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `user` (
    `idUser` INTEGER NOT NULL AUTO_INCREMENT,
    `firstName` VARCHAR(45) NOT NULL,
    `lastName` VARCHAR(45) NOT NULL,
    `phoneNumber` VARCHAR(45) NOT NULL,
    `email` VARCHAR(45) NOT NULL,
    `password` VARCHAR(45) NULL,

    PRIMARY KEY (`idUser`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `pet` ADD CONSTRAINT `fk_Pet_User` FOREIGN KEY (`User_idUser`) REFERENCES `user`(`idUser`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `reservation` ADD CONSTRAINT `fk_Reservation_Pet1` FOREIGN KEY (`Pet_idPet`) REFERENCES `pet`(`idPet`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `reservation` ADD CONSTRAINT `fk_Reservation_PetHotel1` FOREIGN KEY (`PetHotel_idPetHotel`) REFERENCES `pethotel`(`idPetHotel`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `reservation` ADD CONSTRAINT `fk_Reservation_User1` FOREIGN KEY (`User_idUser`) REFERENCES `user`(`idUser`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `review` ADD CONSTRAINT `fk_Review_PetHotel1` FOREIGN KEY (`PetHotel_idPetHotel`) REFERENCES `pethotel`(`idPetHotel`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `review` ADD CONSTRAINT `fk_Review_User1` FOREIGN KEY (`User_idUser`) REFERENCES `user`(`idUser`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `term` ADD CONSTRAINT `fk_Term_PetHotel1` FOREIGN KEY (`PetHotel_idPetHotel`) REFERENCES `pethotel`(`idPetHotel`) ON DELETE NO ACTION ON UPDATE NO ACTION;
