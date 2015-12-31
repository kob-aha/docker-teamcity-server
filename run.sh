#!/bin/bash 

docker run -d -p 8111:8111 -v=`pwd`/.TeamCity:/root/.BuildServer --rm --name teamcity-server teamcity-server
