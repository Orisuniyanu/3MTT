FROM ubuntu
RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install -y curl vim sudo nginx
COPY 2127_little_fashion /var/www/html
EXPOSE 80
