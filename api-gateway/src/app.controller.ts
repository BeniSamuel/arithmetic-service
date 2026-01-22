import { Controller, Get, Query, Inject } from '@nestjs/common';
import { ClientProxy } from '@nestjs/microservices';
import { firstValueFrom } from 'rxjs';

@Controller('calculator')
export class AppController {
  constructor(
    @Inject('ADD_SERVICE') private addService: ClientProxy,
    @Inject('SUBTRACT_SERVICE') private subtractService: ClientProxy,
    @Inject('RESULT_SERVICE') private resultService: ClientProxy,
  ) {}

  @Get('add')
  async add(@Query('a') a: number, @Query('b') b: number) {
    const sum = await firstValueFrom(
      this.addService.send({ cmd: 'add' }, { a: +a, b: +b }),
    );

    return firstValueFrom(
      this.resultService.send(
        { cmd: 'result' },
        { operation: 'addition', value: sum },
      ),
    );
  }

  @Get('subtract')
  async subtract(@Query('a') a: number, @Query('b') b: number) {
    const diff = await firstValueFrom(
      this.subtractService.send(
        { cmd: 'subtract' },
        { a: +a, b: +b },
      ),
    );

    return firstValueFrom(
      this.resultService.send(
        { cmd: 'result' },
        { operation: 'subtraction', value: diff },
      ),
    );
  }
}
