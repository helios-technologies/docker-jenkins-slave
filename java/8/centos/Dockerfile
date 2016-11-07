FROM centos:7

MAINTAINER Camille Meulien <camille.meulien@gmail.com>

COPY entrypoint.sh /usr/bin/
RUN chmod 755 /usr/bin/entrypoint.sh
ENTRYPOINT ["/usr/bin/entrypoint.sh"]

#
# Install Java
#
ENV HOME=/home/jenkins-slave \
    JAVA_HOME=/usr/java/latest \
    MAVEN_VERSION=3.3.9 \
    JAVA_VERSION=8 JAVA_UPDATE=112 JAVA_BUILD=15
ENV JRE_HOME=${JAVA_HOME}/jre

RUN curl -sSLo jdk-${JAVA_VERSION}u${JAVA_UPDATE}-linux-x64.rpm \
    --header "Cookie: oraclelicense=accept-securebackup-cookie;" \
    http://download.oracle.com/otn-pub/java/jdk/${JAVA_VERSION}u${JAVA_UPDATE}-b${JAVA_BUILD}/jdk-${JAVA_VERSION}u${JAVA_UPDATE}-linux-x64.rpm \
    && rpm -ivh jdk-${JAVA_VERSION}u${JAVA_UPDATE}-linux-x64.rpm \
    && rm -f jdk-${JAVA_VERSION}u${JAVA_UPDATE}-linux-x64.rpm

#
# Install Maven
#
ENV MAVEN_HOME=/usr/share/apache-maven-${MAVEN_VERSION} \
    PATH=${MAVEN_HOME}/bin:${PATH} \
    MAVEN_OPTS=-Duser.home=${HOME}

RUN curl -sSLo /usr/share/maven.tar.gz \
    http://apache.mirrors.ovh.net/ftp.apache.org/dist/maven/maven-3/${MAVEN_VERSION}/binaries/apache-maven-${MAVEN_VERSION}-bin.tar.gz \
    && cd /usr/share \
    && tar xvzf maven.tar.gz \
    && rm -f maven.tar.gz

#
# Install Jenkins Swarm
#
ENV JENKINS_SWARM_VERSION=2.2 \
    JENKINS_SWARM_JAR_PATH=/usr/share/jenkins
ENV JENKINS_SWARM_JAR=${JENKINS_SWARM_JAR_PATH}/swarm-client-${JENKINS_SWARM_VERSION}-jar-with-dependencies.jar

RUN useradd -d ${HOME} -m jenkins-slave \
    && mkdir -p ${JENKINS_SWARM_JAR_PATH} \
    && chmod 755 ${JENKINS_SWARM_JAR_PATH} \
    && curl -sSLo ${JENKINS_SWARM_JAR} \
    http://repo.jenkins-ci.org/releases/org/jenkins-ci/plugins/swarm-client/${JENKINS_SWARM_VERSION}/swarm-client-${JENKINS_SWARM_VERSION}-jar-with-dependencies.jar

#
# Additional tools & dependencies
#

RUN yum install -y git wget zip unzip gzip2 fontconfig \
    && env | egrep "(JENKINS|JAVA)" > /etc/docker.properties

USER jenkins-slave
VOLUME ${HOME}
