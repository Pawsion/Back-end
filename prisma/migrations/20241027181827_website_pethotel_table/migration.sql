/*
  Warnings:

  - Added the required column `website` to the `pethotel` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE `pethotel` ADD COLUMN `website` VARCHAR(255) NOT NULL;
