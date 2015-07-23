FROM ubuntu

RUN apt-get update && apt-get -y --no-install-recommends install software-properties-common

RUN \
  echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
  add-apt-repository -y ppa:webupd8team/java && \
  apt-get update && \
  apt-get install -y oracle-java8-installer && \
  rm -rf /var/lib/apt/lists/* && \
  rm -rf /var/cache/oracle-jdk8-installer

RUN mkdir -p /opt/maven ; cd /opt/maven ; wget -O - http://apache.mirrors.spacedump.net/maven/maven-3/3.3.3/binaries/apache-maven-3.3.3-bin.tar.gz | tar zxf -
RUN ln -s /opt/maven/apache-maven-3.3.3/bin/mvn /usr/bin

RUN apt-get update && apt-get -y install rpm librpmbuild3
