#stage 1
FROM node:latest@sha256:50b76fc6dc5f03cb3d14c71b8564948aed2bc5124325f35830b2f3be21950af1 as node
WORKDIR /app
COPY sample .
RUN npm install
RUN npm run build --prod

#stage 2
FROM nginx:alpine@sha256:659610aadb34b7967dea7686926fdcf08d588a71c5121edb094ce0e4cdbc45e6
COPY --from=node /app/dist/sample /usr/share/nginx/html
EXPOSE 80
