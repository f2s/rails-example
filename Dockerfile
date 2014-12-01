FROM ubuntu:14.04

RUN apt-get update && \
    apt-get install -y git curl rails nodejs libsqlite3-dev && \
    mkdir -p /app && cd /app && \
    rails new testing123 && cd testing123 && \
    bundle install

EXPOSE 3000/tcp

CMD cd /app/testing123 && rails server