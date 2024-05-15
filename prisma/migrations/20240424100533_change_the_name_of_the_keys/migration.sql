/*
  Warnings:

  - The primary key for the `pet` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `User_idUser` on the `pet` table. All the data in the column will be lost.
  - You are about to drop the column `idPet` on the `pet` table. All the data in the column will be lost.
  - The primary key for the `pethotel` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `idPetHotel` on the `pethotel` table. All the data in the column will be lost.
  - The primary key for the `reservation` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `PetHotel_idPetHotel` on the `reservation` table. All the data in the column will be lost.
  - You are about to drop the column `Pet_idPet` on the `reservation` table. All the data in the column will be lost.
  - You are about to drop the column `User_idUser` on the `reservation` table. All the data in the column will be lost.
  - You are about to drop the column `idReservation` on the `reservation` table. All the data in the column will be lost.
  - The primary key for the `review` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `PetHotel_idPetHotel` on the `review` table. All the data in the column will be lost.
  - You are about to drop the column `User_idUser` on the `review` table. All the data in the column will be lost.
  - You are about to drop the column `idReview` on the `review` table. All the data in the column will be lost.
  - The primary key for the `term` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `PetHotel_idPetHotel` on the `term` table. All the data in the column will be lost.
  - You are about to drop the column `idTerm` on the `term` table. All the data in the column will be lost.
  - The primary key for the `user` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `idUser` on the `user` table. All the data in the column will be lost.
  - Added the required column `id` to the `pet` table without a default value. This is not possible if the table is not empty.
  - Added the required column `idUser` to the `pet` table without a default value. This is not possible if the table is not empty.
  - Added the required column `id` to the `pethotel` table without a default value. This is not possible if the table is not empty.
  - Added the required column `id` to the `reservation` table without a default value. This is not possible if the table is not empty.
  - Added the required column `idPet` to the `reservation` table without a default value. This is not possible if the table is not empty.
  - Added the required column `idPetHotel` to the `reservation` table without a default value. This is not possible if the table is not empty.
  - Added the required column `idUser` to the `reservation` table without a default value. This is not possible if the table is not empty.
  - Added the required column `id` to the `review` table without a default value. This is not possible if the table is not empty.
  - Added the required column `idPetHotel` to the `review` table without a default value. This is not possible if the table is not empty.
  - Added the required column `idUser` to the `review` table without a default value. This is not possible if the table is not empty.
  - Added the required column `id` to the `term` table without a default value. This is not possible if the table is not empty.
  - Added the required column `idPetHotel` to the `term` table without a default value. This is not possible if the table is not empty.
  - Added the required column `id` to the `user` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE `pet` DROP FOREIGN KEY `fk_Pet_User`;

-- DropForeignKey
ALTER TABLE `reservation` DROP FOREIGN KEY `fk_Reservation_Pet1`;

-- DropForeignKey
ALTER TABLE `reservation` DROP FOREIGN KEY `fk_Reservation_PetHotel1`;

-- DropForeignKey
ALTER TABLE `reservation` DROP FOREIGN KEY `fk_Reservation_User1`;

-- DropForeignKey
ALTER TABLE `review` DROP FOREIGN KEY `fk_Review_PetHotel1`;

-- DropForeignKey
ALTER TABLE `review` DROP FOREIGN KEY `fk_Review_User1`;

-- DropForeignKey
ALTER TABLE `term` DROP FOREIGN KEY `fk_Term_PetHotel1`;

-- AlterTable
ALTER TABLE `pet` DROP PRIMARY KEY,
    DROP COLUMN `User_idUser`,
    DROP COLUMN `idPet`,
    ADD COLUMN `id` INTEGER NOT NULL,
    ADD COLUMN `idUser` INTEGER NOT NULL,
    ADD PRIMARY KEY (`id`);

-- AlterTable
ALTER TABLE `pethotel` DROP PRIMARY KEY,
    DROP COLUMN `idPetHotel`,
    ADD COLUMN `id` INTEGER NOT NULL AUTO_INCREMENT,
    ADD PRIMARY KEY (`id`);

-- AlterTable
ALTER TABLE `reservation` DROP PRIMARY KEY,
    DROP COLUMN `PetHotel_idPetHotel`,
    DROP COLUMN `Pet_idPet`,
    DROP COLUMN `User_idUser`,
    DROP COLUMN `idReservation`,
    ADD COLUMN `id` INTEGER NOT NULL,
    ADD COLUMN `idPet` INTEGER NOT NULL,
    ADD COLUMN `idPetHotel` INTEGER NOT NULL,
    ADD COLUMN `idUser` INTEGER NOT NULL,
    ADD PRIMARY KEY (`id`);

-- AlterTable
ALTER TABLE `review` DROP PRIMARY KEY,
    DROP COLUMN `PetHotel_idPetHotel`,
    DROP COLUMN `User_idUser`,
    DROP COLUMN `idReview`,
    ADD COLUMN `id` INTEGER NOT NULL AUTO_INCREMENT,
    ADD COLUMN `idPetHotel` INTEGER NOT NULL,
    ADD COLUMN `idUser` INTEGER NOT NULL,
    ADD PRIMARY KEY (`id`);

-- AlterTable
ALTER TABLE `term` DROP PRIMARY KEY,
    DROP COLUMN `PetHotel_idPetHotel`,
    DROP COLUMN `idTerm`,
    ADD COLUMN `id` INTEGER NOT NULL AUTO_INCREMENT,
    ADD COLUMN `idPetHotel` INTEGER NOT NULL,
    ADD PRIMARY KEY (`id`);

-- AlterTable
ALTER TABLE `user` DROP PRIMARY KEY,
    DROP COLUMN `idUser`,
    ADD COLUMN `id` INTEGER NOT NULL AUTO_INCREMENT,
    ADD PRIMARY KEY (`id`);

-- CreateIndex
CREATE INDEX `fk_Pet_User_idx` ON `pet`(`idUser`);

-- CreateIndex
CREATE INDEX `fk_Reservation_Pet1_idx` ON `reservation`(`idPet`);

-- CreateIndex
CREATE INDEX `fk_Reservation_PetHotel1_idx` ON `reservation`(`idPetHotel`);

-- CreateIndex
CREATE INDEX `fk_Reservation_User1_idx` ON `reservation`(`idUser`);

-- CreateIndex
CREATE INDEX `fk_Review_PetHotel1_idx` ON `review`(`idPetHotel`);

-- CreateIndex
CREATE INDEX `fk_Review_User1_idx` ON `review`(`idUser`);

-- CreateIndex
CREATE INDEX `fk_Term_PetHotel1_idx` ON `term`(`idPetHotel`);

-- AddForeignKey
ALTER TABLE `pet` ADD CONSTRAINT `fk_Pet_User` FOREIGN KEY (`idUser`) REFERENCES `user`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `reservation` ADD CONSTRAINT `fk_Reservation_Pet1` FOREIGN KEY (`idPet`) REFERENCES `pet`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `reservation` ADD CONSTRAINT `fk_Reservation_PetHotel1` FOREIGN KEY (`idPetHotel`) REFERENCES `pethotel`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `reservation` ADD CONSTRAINT `fk_Reservation_User1` FOREIGN KEY (`idUser`) REFERENCES `user`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `review` ADD CONSTRAINT `fk_Review_PetHotel1` FOREIGN KEY (`idPetHotel`) REFERENCES `pethotel`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `review` ADD CONSTRAINT `fk_Review_User1` FOREIGN KEY (`idUser`) REFERENCES `user`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `term` ADD CONSTRAINT `fk_Term_PetHotel1` FOREIGN KEY (`idPetHotel`) REFERENCES `pethotel`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
