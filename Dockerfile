# Flutter Web Dockerfile
FROM cirrusci/flutter AS build-env


RUN flutter pub global activate webdev

RUN mkdir /app

COPY . /app

WORKDIR /app

RUN flutter clean

RUN flutter pub get

RUN flutter build web

# Build the image

FROM nginx:1.21.1-alpine AS serve-env

COPY --from=build-env /app/build/web /usr/share/nginx/html
