FROM amazonlinux:latest
ADD measure-disk-random.sh /home/ec2-user/measure-disk-random.sh
RUN yum update -y
RUN chmod a+x ./measure-disk-random.sh
RUN ["/bin/bash", "/measure-disk-random.sh"]