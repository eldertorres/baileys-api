FROM node:20-slim AS builder

WORKDIR /app

RUN apt-get update && apt-get install -y \
        git \
        && rm -rf /var/lib/apt/lists/*

COPY package*.json .

COPY . .

RUN npm install && \ 
    npm run build

EXPOSE 3000

CMD [ "npm", "run", "start" ]