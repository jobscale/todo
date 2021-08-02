FROM node:buster-slim
SHELL ["bash", "-c"]
WORKDIR /home/node
COPY . .
RUN chown -R node. .
USER node
RUN rm -f package-lock.json && npm i && npm run lint
CMD ["npm", "run", "container"]
