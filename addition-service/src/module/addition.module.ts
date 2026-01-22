import { Module } from "@nestjs/common";
import { AdditionController } from "./addition.controller";
import { AdditionService } from "./addition.service";

@Module({
  controllers: [AdditionController],
  providers: [AdditionService],
})
export class AdditionModule {}
