import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { SubtractionModule } from './module/subtraction.module';

@Module({
  imports: [SubtractionModule],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule {}
