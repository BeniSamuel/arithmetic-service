import { Controller } from "@nestjs/common";
import { MessagePattern } from "@nestjs/microservices";

type ResultReturnType = {
  operation: string;
  result: number;
  message: string;
};

@Controller()
export class ResultController {
  @MessagePattern({ cmd: "result" })
  resultPrint(data: { operation: string; value: number }): ResultReturnType {
    return {
      operation: data.operation,
      result: data.value,
      message: `The result of ${data.operation} = ${data.value}`,
    };
  }
}
