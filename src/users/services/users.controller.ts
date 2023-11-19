import { Controller, Get, HttpStatus, Post, Req } from '@nestjs/common';
import { UsersService } from './users.service';
import { AppRequest, getUserIdFromRequest } from 'src/shared';

@Controller('api/users')
export class UsersController {
  constructor(private userService: UsersService) {}

  @Get()
  async getUsers() 
  {
    const users = await this.userService.getAllUsers();

    return {
      statusCode: HttpStatus.OK,
      message: 'OK',
      data: { users },
    };
  }

  @Post('register')
  async registerUser(@Req() req: AppRequest) 
  {
    const user = await this.userService.createOne(req.body);

    return {
      statusCode: HttpStatus.OK,
      message: 'OK',
      data: { user },
    };
  }
}