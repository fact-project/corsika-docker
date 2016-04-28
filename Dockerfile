FROM ubuntu:16.04

ARG CORSIKA_PASSWORD

RUN apt-get -y update

# CORSIKA & IACT package 
RUN apt-get -y install gfortran \
	curl perl libdata-dumper-concise-perl \
	csh make vim

RUN curl ftp://ikp-ftp.ikp.kit.edu/corsika-v740/corsika-74100.tar.gz \
	--user corsika:${CORSIKA_PASSWORD} | tar xvz -C /opt 

# RUN curl https://www.mpi-hd.mpg.de/hfm/~bernlohr/iact-atmo/bernlohr-1.49.tar.gz \
# 	| tar xvz -C /opt/corsika-74100/bernlohr

ADD config.h /opt/corsika-74100/include
RUN cd /opt/corsika-74100 && ./coconut < /dev/null
ADD atmprof7.dat /opt/corsika-74100/run
ADD atmprof8.dat /opt/corsika-74100/run

ENV DISPLAY :0
WORKDIR /opt/corsika/run
