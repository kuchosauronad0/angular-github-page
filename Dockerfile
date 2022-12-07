#stage 1
FROM node:latest@sha256:50b76fc6dc5f03cb3d14c71b8564948aed2bc5124325f35830b2f3be21950af1 as node
WORKDIR /app
COPY sample .
RUN npm install
RUN npm run build --prod

#stage 2
FROM nginx:alpine@sha256:455c39afebd4d98ef26dd70284aa86e6810b0485af5f4f222b19b89758cabf1e
COPY --from=node /app/dist/sample /usr/share/nginx/html
EXPOSE 80
