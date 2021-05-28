FROM node:lts-buster-slim
WORKDIR /home/node
ENV DEBIAN_FRONTEND noninteractive
RUN echo fs.inotify.max_user_watches=524288 | tee -a /etc/sysctl.conf
COPY . .
RUN chown -R node. .
USER node
RUN npm i && npm run lint
EXPOSE 3000
CMD ["npm", "start"]
