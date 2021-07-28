FROM node:buster-slim
WORKDIR /home/node
ENV DEBIAN_FRONTEND noninteractive
RUN apt update && apt install -y nginx-extras
RUN rm -fr /var/lib/apt/lists/*
RUN echo fs.inotify.max_user_watches=524288 | tee -a /etc/sysctl.conf
COPY . .
RUN chown -R node. .
USER node
RUN rm -f package-lock.json && npm i && npm run lint && npm run build
RUN rm -fr /var/www/html && ln -sfn $(pwd)/build /var/www/html
