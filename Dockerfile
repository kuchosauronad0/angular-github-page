#stage 1
FROM node:latest@sha256:b9ccc4aca32eebf124e0ca0fd573dacffba2b9236987a1d4d2625ce3c162ecc8 as node
WORKDIR /app
COPY sample .
RUN npm install
RUN npm run build --prod

#stage 2
FROM nginx:alpine@sha256:6fab99ef26a305476666eb5242a0788a80535ebca4542d519fe07eeac057b664
COPY --from=node /app/dist/sample /usr/share/nginx/html
EXPOSE 80
