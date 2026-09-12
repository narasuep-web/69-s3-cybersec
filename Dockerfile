FROM node:20-alpine

RUN apk update && apk add --no-cache build-base gcc autoconf automake zlib-dev libpng-dev nasm bash vips-dev

WORKDIR /opt/app

COPY package*.json ./
RUN npm install

COPY . .

ENV NODE_ENV=development
RUN npm run build

EXPOSE 1337

CMD ["npm", "run", "develop"]