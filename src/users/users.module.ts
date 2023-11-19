import { Module } from '@nestjs/common';

import { UsersService } from './services';
import { DBModule } from 'src/db.module';
import { UsersController } from './services/users.controller';

@Module({
  imports: [DBModule],
  providers: [ UsersService ],
  exports: [ UsersService ],
  controllers: [UsersController],
  
})
export class UsersModule {}
