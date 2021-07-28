FROM node:buster-slim
WORKDIR /var/www
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y nginx-extras
RUN rm -fr /var/lib/apt/lists/*
RUN echo fs.inotify.max_user_watches=524288 | tee -a /etc/sysctl.conf
COPY . .
RUN rm -fr html && ln -sfn build html
RUN chown -R www-data. .
USER www-data
RUN rm -f package-lock.json && npm i && npm run lint && npm run build
