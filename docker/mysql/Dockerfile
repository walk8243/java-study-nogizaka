FROM mariadb:latest

RUN sed -i 's/\[client\]/[client]\ndefault-character-set = utf8mb4/' /etc/mysql/mariadb.conf.d/50-client.cnf
