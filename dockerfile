# Use official lightweight Apache HTTPD image
FROM httpd:2.4-alpine

RUN apk update && \
    apk add --no-cache bash

RUN apk add --no-cache python3

# Copy site content (place your site in ./public)
COPY ./mojastrona/ /usr/local/apache2/htdocs/

EXPOSE 80

# Use default httpd entrypoint and cmd from base image