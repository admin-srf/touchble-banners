FROM nginx:alpine

ARG PORT
RUN test -n "$PORT" || (echo "ERROR: PORT build arg is required. Use --build-arg PORT=<port>" && exit 1)

COPY nginx.conf /etc/nginx/conf.d/default.conf
RUN sed -i "s/__PORT__/${PORT}/" /etc/nginx/conf.d/default.conf

COPY index.html /usr/share/nginx/html/index.html
COPY links.json /usr/share/nginx/html/links.json
COPY images/ /usr/share/nginx/html/images/

EXPOSE $PORT
