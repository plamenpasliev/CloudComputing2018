FROM amazonlinux:latest
ADD measure-mem.sh /home/ec2-user/measure-mem.sh
RUN yum update -y
RUN chmod a+x ./measure-mem.sh
RUN ["/bin/bash", "/measure-mem.sh"]