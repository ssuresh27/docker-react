FROM node:16-alpine as stage

WORKDIR '/apps'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
COPY --from=stage /apps/build /usr/share/nginx/html

#Default nginx commend is start nginx