FROM node:20-alpine as build

ARG VITE_SERVER_HOST
ENV VITE_SERVER_HOST=$VITE_SERVER_HOST

WORKDIR /app

COPY package.json .

RUN npm install

COPY . .

RUN npm run build

FROM nginx:latest as production

COPY --from=build /app/dist /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]