FROM ubuntu:14.04


RUN mkdir /u01 && \ 
    chmod a+xr /u01 

## to enable Puppet - see https://docs.puppetlabs.com/guides/install_puppet/install_debian_ubuntu.html

RUN apt-get install -q -y wget
RUN wget https://apt.puppetlabs.com/puppetlabs-release-trusty.deb
RUN dpkg -i puppetlabs-release-trusty.deb
RUN apt-get update
RUN  apt-get install -q -y puppet

ADD /manifests/ /u01/manifests/
ADD /modules/ /u01/modules/

# see https://chrisjean.com/convert-dos-formatted-files-to-unix-format-in-ubuntu-and-centos/
RUN apt-get install -q -y dos2unix
# remove Windows end of line characters
RUN dos2unix /u01/manifests/*
RUN dos2unix /u01/modules/*

