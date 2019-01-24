FROM amazonlinux:latest
RUN yum update -y

#install nginx
RUN yum install -y nginx

#remove default nginx config
RUN rm -v /etc/nginx/nginx.conf

#add new config
ADD backend.nginx.conf /etc/nginx/

# Expose ports
EXPOSE 80

CMD service nginx start
