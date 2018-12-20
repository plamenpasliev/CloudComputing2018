FROM amazonlinux:latest
ADD measure-cpu.sh /home/ec2-user/measure-cpu.sh
RUN yum update -y
RUN chmod a+x ./measure-cpu.sh
RUN ["/bin/bash", "/measure-cpu.sh"]