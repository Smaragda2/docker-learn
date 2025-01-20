FROM node:14-alpine as webBuilder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
COPY --from=webBuilder /app/build /usr/share/nginx/html