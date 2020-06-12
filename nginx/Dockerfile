FROM nginx:1.13-alpine
COPY nginx.conf /etc/nginx/nginx.conf
RUN mkdir -p /var/www/html \
 && touch /var/www/html/index.html \
 && echo 'test' > /var/www/html/index.html
