MAINTAINER Hawkore

FROM debian:9.2

RUN DEBIAN_FRONTEND=noninteractive apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -yq --no-install-recommends curl

# JDK (idea from anapsix)

RUN curl -jksSLH "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u151-b12/e758a0de34e24606bca991d704f6dcbf/jdk-8u151-linux-x64.tar.gz \
	| tar -C /opt -xz
RUN ln -s /opt/jdk1.8.0_151 /opt/jdk

ENV JAVA_HOME=/opt/jdk
ENV PATH=${PATH}:/opt/jdk/bin

# Cleanup

RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
