#stage 1
FROM node:latest@sha256:e18c3ccdf7d71619990b0e85639f506e2028a95410999cab24cc373cbd10e0ac as node
WORKDIR /app
COPY sample .
RUN npm install
RUN npm run build --prod

#stage 2
FROM nginx:alpine@sha256:6fab99ef26a305476666eb5242a0788a80535ebca4542d519fe07eeac057b664
COPY --from=node /app/dist/sample /usr/share/nginx/html
EXPOSE 80
