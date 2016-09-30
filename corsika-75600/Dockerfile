FROM ubuntu:16.04

ARG CORSIKA_PASSWORD

RUN apt-get -y update

# CORSIKA & IACT package 
RUN apt-get -y install gfortran \
	curl perl libdata-dumper-concise-perl \
	csh make vim

RUN curl ftp://ikp-ftp.ikp.kit.edu/corsika-v750/corsika-75600.tar.gz \
	--user corsika:${CORSIKA_PASSWORD} | tar xvz -C /opt 

ADD config.h /opt/corsika-75600/include
RUN cd /opt/corsika-75600 && ./coconut < /dev/null && ./coconut -i


WORKDIR /opt/corsika-75600/run
CMD bash
