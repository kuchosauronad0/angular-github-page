#stage 1
FROM node:latest@sha256:f62cd4433edc4b397218d9bc005a2f2865d7827753fd480a166e247127384900 as node
WORKDIR /app
COPY sample .
RUN npm install
RUN npm run build --prod

#stage 2
FROM nginx:alpine@sha256:659610aadb34b7967dea7686926fdcf08d588a71c5121edb094ce0e4cdbc45e6
COPY --from=node /app/dist/sample /usr/share/nginx/html
EXPOSE 80
