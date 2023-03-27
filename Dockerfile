#stage 1
FROM node:latest@sha256:d903b23148dccca63152cb2bdf6fdfa062842dcce49f0d45558ca06a8ab14598 as node
WORKDIR /app
COPY sample .
RUN npm install
RUN npm run build --prod

#stage 2
FROM nginx:alpine@sha256:6318314189b40e73145a48060bff4783a116c34cc7241532d0d94198fb2c9629
COPY --from=node /app/dist/sample /usr/share/nginx/html
EXPOSE 80
