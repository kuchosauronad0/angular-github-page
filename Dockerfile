#stage 1
FROM node:latest@sha256:33e99abf6cd64858bf5cc44824f1e50b7de61c9b9a3622c407951412a33fc28e as node
WORKDIR /app
COPY sample .
RUN npm install
RUN npm run build --prod

#stage 2
FROM nginx:alpine@sha256:659610aadb34b7967dea7686926fdcf08d588a71c5121edb094ce0e4cdbc45e6
COPY --from=node /app/dist/sample /usr/share/nginx/html
EXPOSE 80
