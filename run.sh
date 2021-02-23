#openssl req -newkey rsa:2048 -nodes -keyout webserver/nginx/certs/coder.key -x509 -days 365 -out webserver/nginx/certs/coder.crt
export CURRENT_UID=$(id -u):$(id -g) && docker-compose up