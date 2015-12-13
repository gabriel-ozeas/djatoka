FROM tomcat:8-jre8
MAINTAINER Gabriel Ozeas <gabriel.ozeas@gmail.com>

ENV DJATOKA_HOME /usr/local/djatoka/adore-djatoka-1.1
RUN mkdir -p "$DJATOKA_HOME"

ENV LIBPATH $DJATOKA_HOME/lib
ENV PLATFORM Linux-x86-64
ENV LD_LIBRARY_PATH /usr/local/lib
ENV KAKADU_LIBRARY_PATH -DLD_LIBRARY_PATH=$LIBPATH/$PLATFORM
ENV KAKADU_HOME $DJATOKA_HOME/bin/$PLATFORM

COPY docker/tomcat/bin/setenv.sh $CATALINA_HOME/bin/

COPY lib/Linux-x86-64/* $LD_LIBRARY_PATH/
COPY dist/adore-djatoka.war webapps/
COPY lib  $DJATOKA_HOME/lib/
COPY etc  $DJATOKA_HOME/etc/
COPY dist $DJATOKA_HOME/dist/
COPY src  $DJATOKA_HOME/src/
COPY bin  $DJATOKA_HOME/bin/

#RUN apt-get update
RUN mkdir /var/log/djatoka
