#stage 1
FROM node:latest@sha256:14f0471d0478fbb9177d0f9e8c146dc872273dcdcfc7fea93a27ed81fc6b0e96 as node
WORKDIR /app
COPY sample .
RUN npm install
RUN npm run build --prod

#stage 2
FROM nginx:alpine@sha256:31bad00311cb5eeb8a6648beadcf67277a175da89989f14727420a80e2e76742
COPY --from=node /app/dist/sample /usr/share/nginx/html
EXPOSE 80
