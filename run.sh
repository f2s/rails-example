#!/bin/bash

sudo docker rm -f rails &>/dev/null

sudo docker run -d \
                -p 3000:3000 \
                --name rails \
                -t test/rails