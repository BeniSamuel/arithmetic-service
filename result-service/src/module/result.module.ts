import { Module } from "@nestjs/common";
import { ResultController } from "./result.controller";

@Module({
  controllers: [ResultController],
  providers: [],
  exports: [],
})
export class ResultModule {}
