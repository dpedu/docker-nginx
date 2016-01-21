FROM ubuntu:trusty

RUN apt-get update && \
    apt-get install -y nginx-light supervisor && \
    rm -rf /var/lib/apt/lists/* && \
    echo 'daemon off;' >> /etc/nginx/nginx.conf

# Supervisor confs
ADD supervisor.conf /etc/supervisor/conf.d/supervisor.conf
ADD supervisor-nginx.conf /etc/supervisor/conf.d/nginx.conf

# Startup tasks

ENTRYPOINT ["supervisord"]

EXPOSE 80
EXPOSE 443

