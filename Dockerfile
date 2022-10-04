FROM node:lts-buster-slim
SHELL ["bash", "-c"]
WORKDIR /home/node
COPY . .
RUN chown -R node. .
USER node
RUN npm i --legacy-peer-deps && npm run lint
CMD ["npm", "run", "container"]
