## Creates Complet Webmin / Usermin Servers
FROM dockerimages/ubuntu-core:14.04
MAINTAINER Frank Lemanschik
#RUN echo "deb http://download.webmin.com/download/repository trusty contrib \n\
#deb http://webmin.mirror.somersettechsolutions.co.uk/repository trusty contrib" > /etc/apt/sources.list.d/webmin.list \
RUN echo Acquire::GzipIndexes "false"; > /etc/apt/apt.conf.d/docker-gzip-indexes
 && apt-get update && apt-get install \
 wget \
 libnet-ssleay-perl \
 openssl \
 libauthen-pam-perl \
 libio-pty-perl \
 screen \
 apt-show-versions \
 python \
 && wget http://prdownloads.sourceforge.net/webadmin/usermin_1.610_all.deb \
 && wget wget http://prdownloads.sourceforge.net/webadmin/webmin_1.700_all.deb \
 && dpkg --install webmin_1.700_all.deb \
 && dpkg --install usermin_1.610_all.deb
CMD ["screen" "-AmdS" "service" "webmin" "start"]

