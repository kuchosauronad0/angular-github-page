#stage 1
FROM node:latest@sha256:438603bbb5cda404b9416f0b5c8026f61501ab911760d861ec28c36b5d675725 as node
WORKDIR /app
COPY sample .
RUN npm install
RUN npm run build --prod

#stage 2
FROM nginx:alpine@sha256:6fab99ef26a305476666eb5242a0788a80535ebca4542d519fe07eeac057b664
COPY --from=node /app/dist/sample /usr/share/nginx/html
EXPOSE 80
