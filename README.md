# Docker container for corsika


This will build a docker container for CORSIKA

Build it like this:
```
docker build --build-arg CORSIKA_PASSWORD=the_password_you_received -t corsika .
```

This will create a docker image with CORSIKA 7.41 and IACT Package 1.49 build 
with the config given in `config.h`. The install directory is `/opt/corsika-74100/run`

It was created with the following options:
```
options:   URQMD QGSJETII VOLUMEDET TIMEAUTO 
selection: BERNLOHRDIR CERENKOV INTCLONG IACT ATMEXT CEFFIC IACTDIR CERWLEN VIEWCONE IACTEXT
```

## Running something in the container

You can get an interactive shell in the docker container with

```
docker run -it corsika bash
```


## Using the container to run your simulation

Best method is probably to create a new container inheriting from this
and use dockers `ADD` command to add files.


```docker

from corsika

ADD inputcard /root/
RUN cd /opt/corsika-74100/run && \
	corsika74100Linux_QGSII_urqmd < /root/inputcard
```
