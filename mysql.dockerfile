FROM mysql:8.0
LABEL maintainer="Molunerfinn <marksz@teamsz.xyz>"
ARG MYSQL_ROOT_PASSWORD

ENV MYSQL_ROOT_PASSWORD $MYSQL_ROOT_PASSWORD
ENV MYSQL_AUTHENTICATION_PLUGIN mysql_native_password
ENV WORK_PATH /usr/local/db
ENV FILE_0 list.sql
ENV FILE_1 user.sql
USER root

WORKDIR $WORK_PATH/

COPY ./sql/*.sql $WORK_PATH/
COPY ./init_db.sh /docker-entrypoint-initdb.d/init_db.sh

RUN chmod a+x /docker-entrypoint-initdb.d/init_db.sh
