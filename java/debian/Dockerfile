FROM maven:latest

MAINTAINER Camille Meulien <cmeulien@heliostech.fr>

ENV HOME /home/jenkins-slave
ENV JENKINS_SWARM_VERSION 2.0
ENV JENKINS_SWARM_JAR_PATH /usr/share/jenkins
ENV JENKINS_SWARM_JAR  $JENKINS_SWARM_JAR_PATH/swarm-client-$JENKINS_SWARM_VERSION-jar-with-dependencies.jar

RUN useradd -d $HOME -m jenkins-slave \
    && mkdir -p $JENKINS_SWARM_JAR_PATH \
    && chmod 755 $JENKINS_SWARM_JAR_PATH \
    && curl -sSLo $JENKINS_SWARM_JAR http://maven.jenkins-ci.org/content/repositories/releases/org/jenkins-ci/plugins/swarm-client/$JENKINS_SWARM_VERSION/swarm-client-$JENKINS_SWARM_VERSION-jar-with-dependencies.jar

RUN env | grep -E "(JENKINS|JAVA)" > /etc/docker.properties

USER jenkins-slave
VOLUME $HOME

COPY entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh"]
