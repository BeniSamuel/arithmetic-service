import { Module } from "@nestjs/common";
import { SubtractionController } from "./subtraction.controller";

@Module({
    imports: [],
    controllers: [SubtractionController]
})
export class SubtractionModule {}