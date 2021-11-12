# Dockerfile for express App
FROM node:10-alpine

WORKDIR /usr/src/app

COPY src/* ./

RUN npm install

COPY . .

EXPOSE 3000

CMD ["npm", "start"]
