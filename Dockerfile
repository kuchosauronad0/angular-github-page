#stage 1
FROM node:latest@sha256:eee19816ad7ae65dbcac037629c355fa4b369d163a660bc9718df8f945e79eeb as node
WORKDIR /app
COPY sample .
RUN npm install
RUN npm run build --prod

#stage 2
FROM nginx:alpine@sha256:455c39afebd4d98ef26dd70284aa86e6810b0485af5f4f222b19b89758cabf1e
COPY --from=node /app/dist/sample /usr/share/nginx/html
EXPOSE 80
