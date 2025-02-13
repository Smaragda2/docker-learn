FROM node:14-alpine as webBuilder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
EXPOSE 80
COPY --from=webBuilder /app/build /usr/share/nginx/html