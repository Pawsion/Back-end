import { Module } from '@nestjs/common';
import { PetHotelService } from './hotels.service';
import { HotelsController } from './hotels.controller';

@Module({
  providers: [PetHotelService],
  controllers: [HotelsController]
})
export class HotelsModule {}
