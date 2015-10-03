FROM ubuntu:14.04


RUN mkdir /u01 && \ 
    chmod a+xr /u01 

## to enable Puppet

RUN apt-get install -q -y wget
RUN wget https://apt.puppetlabs.com/puppetlabs-release-trusty.deb
RUN dpkg -i puppetlabs-release-trusty.deb
RUN apt-get update
RUN  apt-get install -q -y puppet

# copy the Puppet modules and manifests into the container
ADD /puppet/ /u01/puppet/

# see https://chrisjean.com/convert-dos-formatted-files-to-unix-format-in-ubuntu-and-centos/
RUN apt-get install -q -y dos2unix
# remove Windows end of line characters
RUN dos2unix /u01/puppet/manifests/*
RUN dos2unix /u01/puppet/modules/*