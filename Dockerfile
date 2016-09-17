# Use maven with jdk6, jdk7, and jdk8
FROM ubuntu:latest
MAINTAINER Carmen Alvarez <c@rmen.ca>

RUN apt-get -qq update && apt-get install --no-install-recommends -qqy \
    curl \
    ca-certificates \
    git \
    ssh \
    maven \
    vim \
    software-properties-common

RUN apt-add-repository ppa:justinludwig/tzdata && apt-get update && apt-get install tzdata-java

RUN echo "deb http://archive.ubuntu.com/ubuntu/ trusty main restricted universe multiverse" >> /etc/apt/sources.list && \
    apt-get update && apt-get install --no-install-recommends -qqy \
    openjdk-6-jdk \
    openjdk-7-jdk \
    openjdk-8-jdk

RUN mkdir -p /root/.m2
COPY toolchains.xml /root/.m2/toolchains.xml

ENV JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
ENV JAVA8_HOME=/usr/lib/jvm/java-8-openjdk-amd64
ENV JAVA7_HOME=/usr/lib/jvm/java-7-openjdk-amd64
ENV JAVA6_HOME=/usr/lib/jvm/java-6-openjdk-amd64
