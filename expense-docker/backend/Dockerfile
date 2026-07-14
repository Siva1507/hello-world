FROM node:20-alpine AS builder

WORKDIR /opt/backend

COPY package*.json ./

RUN npm ci

COPY *.js ./


FROM node:20-alpine

RUN addgroup -S expense && adduser -S expense -G expense && \
    mkdir /opt/backend && \
    chown -R expense:expense /opt/backend

ENV DB_HOST="mysql"

WORKDIR /opt/backend

USER expense

COPY --from=builder /opt/backend /opt/backend

CMD ["node", "index.js"]