#stage 1
FROM node:latest@sha256:f62cd4433edc4b397218d9bc005a2f2865d7827753fd480a166e247127384900 as node
WORKDIR /app
COPY sample .
RUN npm install
RUN npm run build --prod

#stage 2
FROM nginx:alpine@sha256:6f94b7f4208b5d5391246c83a96246ca204f15eaf7e636cefda4e6348c8f6101
COPY --from=node /app/dist/sample /usr/share/nginx/html
EXPOSE 80
