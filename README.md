Builds a docker image with rpmbuild, oracle java8 and maven 3.3

To build the docker image:

```
git clone <this repo>
docker build -t imagename .
```

Then to build using the docker image, this will reuse your settings.xml and local maven repository cache across builds and artifacts will be available outside the instance storage

OS X:

```
cd your/maven/projects/root/folder
docker run -v $HOME:/root -v `pwd`:/build -w /build imagename mvn clean package -Pbuild-rpm
```

Windows:
Soon
