FROM  ubuntu:20.04
ADD jdk-11.0.18_linux-x64_bin.tar.gz /
ADD apache-maven-3.9.4-bin.tar.gz /
COPY ./localtime /etc/localtime
ENV JAVA_HOME=/jdk-11.0.18
ENV MAVEN_HOME=/apache-maven-3.9.4
ENV PATH=$JAVA_HOME/bin:$MAVEN_HOME/bin:$PATH

