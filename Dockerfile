#stage 1
FROM node:latest@sha256:e643c0b70dca9704dff42e12b17f5b719dbe4f95e6392fc2dfa0c5f02ea8044d as node
WORKDIR /app
COPY sample .
RUN npm install
RUN npm run build --prod

#stage 2
FROM nginx:alpine@sha256:6fab99ef26a305476666eb5242a0788a80535ebca4542d519fe07eeac057b664
COPY --from=node /app/dist/sample /usr/share/nginx/html
EXPOSE 80
