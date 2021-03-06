FROM docker.io/sotax/rhel7.3

MAINTAINER Neuro Sales team Pune

RUN yum update -y

## Setup apache-tomcat 7.0.73 and started into process ....
RUN wget https://archive.apache.org/dist/tomcat/tomcat-7/v7.0.73/bin/apache-tomcat-7.0.73.tar.gz && \
     tar -xzf apache-tomcat-7.0.73.tar.gz && \
     mv apache-tomcat-7.0.73 /opt/.


## Install Node js ....
#RUN  wget -c https://nodejs.org/dist/v6.10.1/node-v6.10.1.tar.gz && \
#     tar -xzvf node-v6.10.1.tar.gz && cd node-v6.10.1 && ./configure && make && make install && \
#     cd ../ && rm -rf node-v6.10.1.tar.gz && rm -rf node && node --version && npm install pm2 -g

## Copy artifacts to /opt directory of container.
COPY jre-7u80-linux-x64.rpm /opt/.

## Extract RBAUI RBAUI and start application ...
#RUN     cd /opt/ && tar -xzf RBAUI.tar.gz && \
#        rm -rf /opt/apache-tomcat-7.0.73/webapps/*

#RUN mv /opt/*.war /opt/apache-tomcat-7.0.73/webapps/

EXPOSE 3000 8080 5432

RUN rpm -ivh /opt/jre-7u80-linux-x64.rpm
ENV PATH $PATH:/usr/java/jre1.7.0_80/bin

#COPY docker-entrypoint.sh /root/

## Start application with starting application.....
#ENTRYPOINT ["./root/docker-entrypoint.sh"]
