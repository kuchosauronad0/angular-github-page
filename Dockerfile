#stage 1
FROM node:latest@sha256:1fab548e95c779df229e4b50d8d20e222597bda15aeece508098c5ba7723302e as node
WORKDIR /app
COPY sample .
RUN npm install
RUN npm run build --prod

#stage 2
FROM nginx:alpine@sha256:6f94b7f4208b5d5391246c83a96246ca204f15eaf7e636cefda4e6348c8f6101
COPY --from=node /app/dist/sample /usr/share/nginx/html
EXPOSE 80
