#!/bin/bash -ex
yum update
yum upgrade -y
yum install -y docker
service docker start
gpasswd -a ec2-user docker
docker run -d -p 80:80 tyke96/vatcal:latest