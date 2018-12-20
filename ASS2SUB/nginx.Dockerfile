FROM amazonlinux:latest
ADD measure-nginx.sh /home/ec2-user/measure-nginx.sh
RUN yum update -y
RUN chmod a+x ./measure-nginx.sh
RUN ["/bin/bash", "/measure-nginx.sh"]