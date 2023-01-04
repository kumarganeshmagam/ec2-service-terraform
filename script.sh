#!/bin/bash
yum update -y
yum install -y httpd.x86_64
systemctl start httpd.service
systemctl enable httpd.service
echo "Hello User, you finally did it. I am live from $(hostname -f).!!!" >/var/ww.html.index.html