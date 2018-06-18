FROM node:10.4-alpine

WORKDIR /workspace

COPY package.json package-lock.json /workspace/
RUN npm install

COPY index.js /workspace/

CMD node index.js

