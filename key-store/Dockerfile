FROM node:fermium AS worker

WORKDIR /work
COPY package.json .
COPY package-lock.json .
RUN npm ci
COPY tsconfig.json .
COPY src/ src/
RUN npm run build

FROM node:fermium

ENV NODE_ENV=production

WORKDIR /app
COPY --from=worker /work/package.json .
COPY --from=worker /work/package-lock.json .
RUN npm ci
COPY --from=worker /work/dist/ dist/

CMD [ "npm", "start" ]
