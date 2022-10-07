FROM node:12-alpine AS builder
WORKDIR /usr/src/app
COPY package*.json ./
RUN npm ci
COPY tsconfig*.json ./
COPY src src
RUN npm run build

FROM node:12-alpine
LABEL maintainer="Dustin krysak"
LABEL org.opencontainers.image.authors="Dustin krysak <dustin.krysak+maintainer@sysdig.com>"
LABEL status="testing"
LABEL description="This toy container is used for testing pipleline scanning in Sysdig Secure."
ENV NODE_ENV=production
RUN apk add --no-cache tini
WORKDIR /usr/src/app
RUN chown node:node .
USER node
COPY package*.json ./
RUN npm install
COPY --from=builder /usr/src/app/lib/ lib/
EXPOSE 3000
ENTRYPOINT [ "/sbin/tini","--", "node", "lib/server.js" ]
