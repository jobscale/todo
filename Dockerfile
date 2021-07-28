FROM node:buster-slim as builder
WORKDIR /home/node
COPY . .
RUN chown -R node. .
USER node
RUN rm -f package-lock.json && npm i && npm run lint && npm run build

FROM nginx:alpine
WORKDIR /usr/share/nginx
COPY --from=builder /home/node/build html
RUN chown -R nginx. .
USER nginx
