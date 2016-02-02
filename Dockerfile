FROM phusion/baseimage:0.9.18
MAINTAINER gfjardim <gfjardim@gmail.com>
ENV DEBIAN_FRONTEND noninteractive
ADD sources.list /etc/apt/sources.list

# Use baseimage-docker's init system
CMD ["/sbin/my_init"]

# Fix a Debianism of the nobody's uid being 65534
RUN usermod -u 99 nobody && \
    usermod -g 100 nobody

RUN apt-get update -q

#install lab
RUN apt-get install lab

# Install Hamachi
ADD https://secure.logmein.com/labs/logmein-hamachi-2.1.0.139-x64.tgz /tmp/hamachi.tgz
RUN mkdir -p /opt/logmein-hamachi
RUN tar -zxf /tmp/hamachi.tgz --strip-components 1 -C /opt/logmein-hamachi
RUN cd /opt/logmein-hamachi
RUN ./install.sh



