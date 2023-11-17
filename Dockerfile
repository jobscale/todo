FROM node:lts-bookworm-slim
SHELL ["bash", "-c"]
WORKDIR /home/node
COPY --chown=node:staff . .
USER node
RUN npm i --legacy-peer-deps && npm run lint
CMD ["npm", "run", "container"]
