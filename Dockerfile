#stage 1
FROM node:latest@sha256:32fa97f3363975684b08bf4e8a68a47c7905175cc20275b50b974bbd02aba731 as node
WORKDIR /app
COPY sample .
RUN npm install
RUN npm run build --prod

#stage 2
FROM nginx:alpine@sha256:6fab99ef26a305476666eb5242a0788a80535ebca4542d519fe07eeac057b664
COPY --from=node /app/dist/sample /usr/share/nginx/html
EXPOSE 80
