FROM klakegg/hugo AS build

WORKDIR /src

COPY . .

RUN hugo --minify -e "production"

FROM nginx:alpine

COPY default.conf /etc/nginx/conf.d/default.conf

EXPOSE 8080

COPY --from=build /src/public/ /usr/share/nginx/html/