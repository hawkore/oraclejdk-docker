#
# Licensed to the Apache Software Foundation (ASF) under one or more
# contributor license agreements.  See the NOTICE file distributed with
# this work for additional information regarding copyright ownership.
# The ASF licenses this file to You under the Apache License, Version 2.0
# (the "License"); you may not use this file except in compliance with
# the License.  You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

FROM debian:9.6

MAINTAINER Hawkore

RUN DEBIAN_FRONTEND=noninteractive apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -yq --no-install-recommends curl

# JDK (idea from anapsix)

RUN curl -jksSLH "Cookie: oraclelicense=accept-securebackup-cookie" https://download.oracle.com/otn-pub/java/jdk/8u191-b12/2787e4a523244c269598db4e85c51e0c/jdk-8u191-linux-x64.tar.gz \
	| tar -C /opt -xz
RUN ln -s /opt/jdk1.8.0_191 /opt/jdk

ENV JAVA_HOME=/opt/jdk
ENV PATH=${PATH}:/opt/jdk/bin

# Remove unnecesary files (http://www.oracle.com/technetwork/java/javase/jre-8-readme-2095710.html)
RUN rm -rf /opt/jdk/lib/visualvm
RUN rm -rf /opt/jdk/src.zip
# JavaFX
RUN rm -rf /opt/jdk/javafx-src.zip
RUN rm -rf /opt/jdk/jre/THIRDPARTYLICENSEREADME-JAVAFX.txt 
RUN rm -rf /opt/jdk/jre/lib/ant-javafx.jar
RUN rm -rf /opt/jdk/jre/lib/javafx.properties
RUN rm -rf /opt/jdk/jre/lib/jfxswt.jar
RUN rm -rf /opt/jdk/jre/lib/amd64/libdecora_sse.so   
RUN rm -rf /opt/jdk/jre/lib/amd64/libprism_common.so
RUN rm -rf /opt/jdk/jre/lib/amd64/libprism_es2.so
RUN rm -rf /opt/jdk/jre/lib/amd64/libprism_sw.so
RUN rm -rf /opt/jdk/jre/lib/amd64/libfxplugins.so  
RUN rm -rf /opt/jdk/jre/lib/amd64/libglass.so  
RUN rm -rf /opt/jdk/jre/lib/amd64/libgstreamer-lite.so  
RUN rm -rf /opt/jdk/jre/lib/amd64/libjavafx_font_freetype.so
RUN rm -rf /opt/jdk/jre/lib/amd64/libjavafx_font_pango.so
RUN rm -rf /opt/jdk/jre/lib/amd64/libjavafx_font_t2k.so
RUN rm -rf /opt/jdk/jre/lib/amd64/libjavafx-font.so  
RUN rm -rf /opt/jdk/jre/lib/amd64/libjavafx-iio.so  
RUN rm -rf /opt/jdk/jre/lib/amd64/libjfxmedia.so  
RUN rm -rf /opt/jdk/jre/lib/amd64/libjfxwebkit.so  
RUN rm -rf /opt/jdk/jre/lib/amd64/libprism-es2.so 


# Cleanup

RUN DEBIAN_FRONTEND=noninteractive apt-get -yq purge curl
RUN DEBIAN_FRONTEND=noninteractive apt-get -yq auto-remove
RUN DEBIAN_FRONTEND=noninteractive apt-get clean
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
