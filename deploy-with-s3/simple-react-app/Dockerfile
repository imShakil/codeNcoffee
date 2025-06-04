#syntax=docker/dockerfile:1.0


ARG BaseImage=20-alpine

FROM node:${BaseImage} as dev

LABEL author="imshakil"
LABEL email="mh.ice.iu@gmail.com"
LABEL maintainer="Mobarak Hosen Shakil"

WORKDIR /app
COPY package*.json /app/
RUN npm ci
COPY . /app/
RUN npm run build

FROM node:${BaseImage} as builder

WORKDIR /app
COPY --from=dev /app/build ./build
RUN npm install -g serve

EXPOSE 3000

CMD [ "serve", "-s", "build"]
