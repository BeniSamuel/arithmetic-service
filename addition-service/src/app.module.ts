import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { AdditionModule } from './module/addition.module';

@Module({
  imports: [AdditionModule],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule {}
