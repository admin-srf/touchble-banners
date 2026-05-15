FROM nginx:alpine

COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY index.html /usr/share/nginx/html/index.html
COPY links.json /usr/share/nginx/html/links.json
COPY images/ /usr/share/nginx/html/images/

EXPOSE 8081
