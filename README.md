# Docker container for corsika


This will build a docker container for CORSIKA


To build you `cd` into the corsika-<version> directory and then execute `docker build` like this:

```
docker build --build-arg CORSIKA_PASSWORD=the_password_you_received -t <useful container name e.g: corsika:75600> .
```

with the config given in `config.h`. The install directory is `/opt/corsika-<version>/run`

It was created with the following options:
```
options:   TIMEAUTO VOLUMEDET QGSJETII URQMD 
selection: IACTDIR CERENKOV VIEWCONE BERNLOHRDIR IACT ATMEXT
```

Currently there are two directories in this repository, containing Dockerfiles for corsika 7.41 and 7.56 each.

## Running something in the container

You can get an interactive shell in the docker container with

```
docker run -it <useful container name you chose before> bash
```
Add the `--rm ` option to automatically remove the container once it has stopped.

## Mount directories

To access your host file system (e.g. for storing results and accessing input cards), you can mount volumes using the `-v` docker option:

```
docker run -v /absolute/path/to/data:/data -it <useful container name> bash
```

