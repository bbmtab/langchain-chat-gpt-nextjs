FROM node:alpine

WORKDIR /app
COPY . /app

ENV OPENAI_API_KEY=${OPENAI_API_KEY}

RUN apk update \
    && apk add --no-cache git \
    && apk add --no-cache nodejs \
    && npm install mime-types \
    && npm install
    

#CMD ["node", "index.js"]
RUN chmod +x /app/entrypoint.sh
ENTRYPOINT ["/app/entrypoint.sh"]
