FROM ubuntu:14.04

RUN apt-get update && \
    apt-get install -y git curl rails nodejs libsqlite3-dev && \
    mkdir -p /app && cd /app && \
    rails new testing123 && cd testing123 && \
    bundle install

RUN cd /app/testing123 && \
    rails generate controller pages && \
    rm -rf public/index.html && \
    echo "class PagesController < ApplicationController\n\tdef home\n\t\tputs 'event occured'\n\tend\nend" > app/controllers/pages_controller.rb && \
    echo "Example showing: Testing123" > app/views/pages/home.html.erb && \
    echo "Testing123::Application.routes.draw do\n\troot to: 'pages#home'\nend" > config/routes.rb

EXPOSE 3000/tcp

CMD cd /app/testing123 && rails server