FROM amazonlinux:latest
ADD measure-fork.sh /home/ec2-user/measure-fork.sh
RUN yum update -y
RUN chmod a+x ./measure-fork.sh
RUN ["/bin/bash", "/measure-fork.sh"]