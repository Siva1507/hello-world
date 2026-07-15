FROM node:20-alpine

RUN apk add --no-cache curl

RUN addgroup -S expense && \
    adduser -S expense -G expense && \
    mkdir /opt/backend && \
    chown -R expense:expense /opt/backend

ENV DB_HOST=mysql

WORKDIR /opt/backend

USER expense

COPY --from=builder /opt/backend /opt/backend

HEALTHCHECK --interval=30s \
            --timeout=5s \
            --start-period=30s \
            --retries=3 \
CMD curl -f http://localhost:8080/health || exit 1

CMD ["node","index.js"]