FROM postgres:latest

RUN apt-get update && apt-get install -y \
    git \
    build-essential \
    postgresql-server-dev-all \
    postgresql-12-rum \
    less \
    make \
    vim

#clone repo from git
RUN git clone https://github.com/postgrespro/rum /tmp/rum

#changing directory
WORKDIR /tmp/rum
RUN make USE_PGXS=1
RUN make USE_PGXS=1 install

WORKDIR /tmp/db

RUN mkdir /data && chown postgres /data

# copy the schema file;
# we rename the files so that they get executed in the correct order
COPY schema.sql /docker-entrypoint-initdb.d/01.sql
