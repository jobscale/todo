FROM node:lts-buster as builder
WORKDIR /home/node
COPY --chown=node:staff . .
USER node
RUN npm i --legacy-peer-deps && npm run lint
RUN npm run build

FROM nginx:mainline
WORKDIR /usr/share/nginx
COPY nginx.conf /etc/nginx/nginx.conf
COPY default.conf /etc/nginx/conf.d/default.conf
COPY --from=builder --chown=nginx:staff /home/node/build html
