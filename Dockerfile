FROM node:20-alpine

RUN apk add --no-cache \
    aircrack-ng \
    reaver \
    hashcat \
    wireless-tools \
    python3 \
    py3-pip \
    && rm -rf /var/cache/apk/*

WORKDIR /app

COPY package*.json ./
RUN npm install

COPY . .
RUN npm run build

EXPOSE 8080

CMD ["npm", "start"]