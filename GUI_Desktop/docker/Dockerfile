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

# this next line in order to have x-term support in container
RUN apt-get install -q -y libxrender-dev libxtst-dev