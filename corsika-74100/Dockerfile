FROM ubuntu:16.04

ARG CORSIKA_PASSWORD

RUN apt-get -y update

RUN apt-get -y install gfortran \
	curl perl libdata-dumper-concise-perl \
	csh make vim

RUN curl ftp://ikp-ftp.ikp.kit.edu/corsika-v740/corsika-74100.tar.gz \
	--user corsika:${CORSIKA_PASSWORD} | tar xvz -C /opt 


ADD config.h /opt/corsika-74100/include
RUN cd /opt/corsika-74100 && ./coconut < /dev/null
ADD atmprof7.dat atmprof8.dat /opt/corsika-74100/run/

WORKDIR /opt/corsika-74100/run
CMD bash
