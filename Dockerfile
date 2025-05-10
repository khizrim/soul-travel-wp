FROM wordpress:latest

EXPOSE 80

WORKDIR /var/www/html

COPY ./themes /var/www/html/wp-content/themes
COPY ./plugins /var/www/html/wp-content/plugins

COPY ./temp/wp-lang /var/www/html/wp-content/languages
COPY ./temp/wp-uploads /var/www/html/wp-content/uploads
