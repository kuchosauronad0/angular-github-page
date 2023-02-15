#stage 1
FROM node:latest@sha256:33e99abf6cd64858bf5cc44824f1e50b7de61c9b9a3622c407951412a33fc28e as node
WORKDIR /app
COPY sample .
RUN npm install
RUN npm run build --prod

#stage 2
FROM nginx:alpine@sha256:6f94b7f4208b5d5391246c83a96246ca204f15eaf7e636cefda4e6348c8f6101
COPY --from=node /app/dist/sample /usr/share/nginx/html
EXPOSE 80
