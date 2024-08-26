import { Body, Controller, Get, Post } from '@nestjs/common';
import { BlogsService } from './blogs.service';
import { Public } from 'src/shared/decorators';

@Controller('blogs')
export class BlogsController {
  constructor(private readonly blogService: BlogsService) {}

  @Public()
  @Post()
  async createText(@Body('content') content: string) {
    return this.blogService.createText(content);
  }

  @Public()
  @Get()
  async getAllTexts() {
    return this.blogService.getAllTexts();
  }
}
