FROM openjdk:17-jdk-alpine
RUN apk update && apk add maven
COPY ./localtime /etc/localtime

RUN apk add --no-cache msttcorefonts-installer fontconfig
RUN update-ms-fonts
