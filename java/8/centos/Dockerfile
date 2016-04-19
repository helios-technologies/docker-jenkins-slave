FROM centos:7

MAINTAINER Camille Meulien <cmeulien@heliostech.fr>

#
# Install Java
#
ENV JAVA_VERSION 8
ENV JAVA_UPDATE 74
ENV JAVA_BUILD 02

ENV JAVA_HOME /usr/java/latest
ENV JRE_HOME ${JAVA_HOME}/jre

RUN curl -sSLo jdk-${JAVA_VERSION}u${JAVA_UPDATE}-linux-x64.rpm \
    --header "Cookie: oraclelicense=accept-securebackup-cookie;" \
    http://download.oracle.com/otn-pub/java/jdk/${JAVA_VERSION}u${JAVA_UPDATE}-b${JAVA_BUILD}/jdk-${JAVA_VERSION}u${JAVA_UPDATE}-linux-x64.rpm \
    && rpm -ivh jdk-${JAVA_VERSION}u${JAVA_UPDATE}-linux-x64.rpm \
    && rm -f jdk-${JAVA_VERSION}u${JAVA_UPDATE}-linux-x64.rpm

#
# Install Maven
#
ENV MAVEN_VERSION 3.3.9
ENV PATH /usr/share/apache-maven-${MAVEN_VERSION}/bin:${PATH}

RUN curl -sSLo /usr/share/maven.tar.gz \
    http://apache.mirrors.ovh.net/ftp.apache.org/dist/maven/maven-3/${MAVEN_VERSION}/binaries/apache-maven-${MAVEN_VERSION}-bin.tar.gz \
    && cd /usr/share \
    && tar xvzf maven.tar.gz \
    && rm -f maven.tar.gz

#
# Install Jenkins Swarm
#
ENV HOME /home/jenkins-slave
ENV JENKINS_SWARM_VERSION 2.0
ENV JENKINS_SWARM_JAR_PATH /usr/share/jenkins
ENV JENKINS_SWARM_JAR $JENKINS_SWARM_JAR_PATH/swarm-client-$JENKINS_SWARM_VERSION-jar-with-dependencies.jar

RUN useradd -d $HOME -m jenkins-slave \
    && mkdir -p $JENKINS_SWARM_JAR_PATH \
    && chmod 755 $JENKINS_SWARM_JAR_PATH \
    && curl -sSLo $JENKINS_SWARM_JAR \
    http://maven.jenkins-ci.org/content/repositories/releases/org/jenkins-ci/plugins/swarm-client/$JENKINS_SWARM_VERSION/swarm-client-$JENKINS_SWARM_VERSION-jar-with-dependencies.jar

#
# Additional development tools
#

RUN yum install -y git \
    && env | grep -E "(JENKINS|JAVA)" > /etc/docker.properties

USER jenkins-slave
VOLUME $HOME

COPY entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh"]
