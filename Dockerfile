#stage 1
FROM node:latest@sha256:1fab548e95c779df229e4b50d8d20e222597bda15aeece508098c5ba7723302e as node
WORKDIR /app
COPY sample .
RUN npm install
RUN npm run build --prod

#stage 2
FROM nginx:alpine@sha256:6318314189b40e73145a48060bff4783a116c34cc7241532d0d94198fb2c9629
COPY --from=node /app/dist/sample /usr/share/nginx/html
EXPOSE 80
