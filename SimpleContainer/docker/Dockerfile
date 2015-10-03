FROM ubuntu:14.04
ADD files/mynewfile.txt /tmp/
RUN mkdir /tmp/stuff
WORKDIR /tmp
RUN touch somefile.txt
WORKDIR stuff
RUN cp ../*.txt .
EXPOSE 8090
CMD echo "message from brand new container"

