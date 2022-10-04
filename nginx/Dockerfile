FROM node:lts-buster-slim as builder
WORKDIR /home/node
COPY . .
RUN chown -R node. .
USER node
RUN npm i --legacy-peer-deps && npm run lint && npm run build

FROM nginx:alpine
WORKDIR /usr/share/nginx
COPY nginx.conf /etc/nginx/nginx.conf
COPY default.conf /etc/nginx/conf.d/default.conf
COPY --from=builder /home/node/build html
RUN chown -R nginx. .
