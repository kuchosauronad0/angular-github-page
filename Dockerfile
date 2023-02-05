#stage 1
FROM node:latest@sha256:f62cd4433edc4b397218d9bc005a2f2865d7827753fd480a166e247127384900 as node
WORKDIR /app
COPY sample .
RUN npm install
RUN npm run build --prod

#stage 2
FROM nginx:alpine@sha256:455c39afebd4d98ef26dd70284aa86e6810b0485af5f4f222b19b89758cabf1e
COPY --from=node /app/dist/sample /usr/share/nginx/html
EXPOSE 80
