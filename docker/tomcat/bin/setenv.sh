#!/bin/sh

for line in `ls -1 $LIBPATH | grep '.jar'`
	do
		classpath="$classpath:$LIBPATH/$line"
done
export CLASSPATH=.:../build/:$CLASSPATH

JAVA_OPTS="-Djava.awt.headless=true -Xmx512M -Xms64M -Dkakadu.home=$KAKADU_HOME -Djava.library.path=$LIBPATH/$PLATFORM $KAKADU_LIBRARY_PATH"


