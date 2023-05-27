#stage 1
FROM node:latest@sha256:14f0471d0478fbb9177d0f9e8c146dc872273dcdcfc7fea93a27ed81fc6b0e96 as node
WORKDIR /app
COPY sample .
RUN npm install
RUN npm run build --prod

#stage 2
FROM nginx:alpine@sha256:6fab99ef26a305476666eb5242a0788a80535ebca4542d519fe07eeac057b664
COPY --from=node /app/dist/sample /usr/share/nginx/html
EXPOSE 80
