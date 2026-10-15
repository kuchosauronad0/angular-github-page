#stage 1
FROM node:latest@sha256:14f0471d0478fbb9177d0f9e8c146dc872273dcdcfc7fea93a27ed81fc6b0e96 as node
WORKDIR /app
COPY sample .
RUN npm install
RUN npm run build --prod

#stage 2
FROM nginx:alpine@sha256:892bb2152464f0c5d8972593a5f5afaf8054552580b699d95f8ff4af08c2d33d
COPY --from=node /app/dist/sample /usr/share/nginx/html
EXPOSE 80
