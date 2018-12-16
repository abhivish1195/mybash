#!/bin/bash

yum update -yy

yum install nginx

echo "Nginx installed successfully"

systemctl restart nginx 

echo "Check your web browser= localhost or local IP of the machine

