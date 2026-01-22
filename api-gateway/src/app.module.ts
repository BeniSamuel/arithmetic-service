import { Module } from '@nestjs/common';
import { ClientsModule, Transport } from '@nestjs/microservices';
import { AppController } from './app.controller';

// Determine if running in Docker or locally
const isDocker = process.env.DOCKER_ENV === 'true';
const addServiceHost = isDocker ? 'add-service' : 'localhost';
const subtractServiceHost = isDocker ? 'subtract-service' : 'localhost';
const resultServiceHost = isDocker ? 'result-service' : 'localhost';

@Module({
  imports: [
    ClientsModule.register([
      {
        name: 'ADD_SERVICE',
        transport: Transport.TCP,
        options: { host: addServiceHost, port: 3001 },
      },
      {
        name: 'SUBTRACT_SERVICE',
        transport: Transport.TCP,
        options: { host: subtractServiceHost, port: 3002 },
      },
      {
        name: 'RESULT_SERVICE',
        transport: Transport.TCP,
        options: { host: resultServiceHost, port: 3003 },
      },
    ]),
  ],
  controllers: [AppController],
})
export class AppModule { }
