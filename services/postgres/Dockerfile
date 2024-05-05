FROM postgres:latest

RUN apt-get update && apt-get install -y \
    less \
    make \
    vim

WORKDIR /tmp/db

RUN mkdir /data && chown postgres /data

# copy the schema file;
# we rename the files so that they get executed in the correct order
COPY schema.sql /docker-entrypoint-initdb.d/01.sql
