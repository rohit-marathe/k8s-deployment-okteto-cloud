FROM node:16.16.0 as teamalpha
WORKDIR /usr/app
COPY package.json .
RUN npm install
COPY . .
RUN npm run build


FROM nginx
EXPOSE 80
COPY --from=teamalpha /usr/app/build /usr/share/nginx/html