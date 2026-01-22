FROM node:20-alpine

WORKDIR /app

COPY package*.json ./
RUN npm config set registry https://registry.npmjs.org/ \
  && npm config set fetch-retries 5 \
  && npm config set fetch-retry-mintimeout 20000 \
  && npm config set fetch-retry-maxtimeout 120000 \
  && npm ci

COPY . .

RUN npm run build

CMD ["node", "dist/main.js"]
