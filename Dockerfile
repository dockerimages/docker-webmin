FROM dockerimages/ubuntu-core:14.04
RUN echo "deb http://download.webmin.com/download/repository trusty contrib \n\
deb http://webmin.mirror.somersettechsolutions.co.uk/repository trusty contrib" > /etc/apt/sources.list.d/webmin.list \
 && apt-get update && apt-get install wget \
 && wget http://www.webmin.com/jcameron-key.asc \
 && apt-key add jcameron-key.asc \
 && apt-get install webmin screen 
CMD ["screen" "-AmdS" "service" "webmin" "start"]
