import { Controller } from "@nestjs/common";
import { MessagePattern } from "@nestjs/microservices";

@Controller("")
export class AdditionController {
  @MessagePattern({ cmd: "add" })
  calculateSum(data: { a: number; b: number }): number {
    return data.a + data.b;
  }
}
