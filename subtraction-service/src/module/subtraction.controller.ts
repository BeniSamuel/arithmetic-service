import { Controller } from "@nestjs/common";
import { MessagePattern } from "@nestjs/microservices";

@Controller()
export class SubtractionController {
  @MessagePattern({ cmd: "subtract" })
  subtractValues(data: { a: number; b: number }): number {
    return data.a - data.b;
  }
}
