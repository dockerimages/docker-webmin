## Creates Complet Webmin / Usermin Servers
FROM ubuntu:14.04
MAINTAINER Frank Lemanschik
#RUN echo "deb http://download.webmin.com/download/repository trusty contrib \n\
#deb http://webmin.mirror.somersettechsolutions.co.uk/repository trusty contrib" > /etc/apt/sources.list.d/webmin.list \
#RUN apt-get update && apt-get install -y wget
ADD https://raw.githubusercontent.com/dockerimages/ubuntu-installer/master/prepare-base.sh /prepare-base.sh
ADD https://raw.githubusercontent.com/dockerimages/ubuntu-installer/master/lampp.sh /lampp.sh
ADD https://raw.githubusercontent.com/dockerimages/ubuntu-installer/master/webmin.sh /webmin.sh
RUN chmod +x *.sh
RUN /prepare-base.sh
RUN cat /etc/apt/apt.conf.d/01buildconfig
RUN apt-get update
RUN /lampp.sh
RUN /webmin.sh
RUN apt-get update && apt-get install -y openssh-server
RUN mkdir /var/run/sshd
RUN echo 'root:root' |chpasswd
ADD ./run.sh /run.sh
RUN chmod +x /run.sh
CMD ["/run.sh"]

