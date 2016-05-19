FROM centos:centos7

MAINTAINER Camille Meulien <cmeulien@heliostech.fr>

#
# Ansible setup
#

RUN yum install -y epel-release
RUN yum install -y ansible

#
# Jenkins Slave setup
#

ENV HOME=/home/jenkins-slave \
    JENKINS_SWARM_VERSION=2.0 \
    JENKINS_SWARM_JAR_PATH=/usr/share/jenkins \
    JENKINS_SWARM_JAR=$JENKINS_SWARM_JAR_PATH/swarm-client-$JENKINS_SWARM_VERSION-jar-with-dependencies.jar

RUN yum install -y java-1.8.0-openjdk-headless \
    && useradd -d $HOME -m jenkins-slave \
    && mkdir -p $JENKINS_SWARM_JAR_PATH \
    && chmod 755 $JENKINS_SWARM_JAR_PATH \
    && curl -sSLo $JENKINS_SWARM_JAR http://maven.jenkins-ci.org/content/repositories/releases/org/jenkins-ci/plugins/swarm-client/$JENKINS_SWARM_VERSION/swarm-client-$JENKINS_SWARM_VERSION-jar-with-dependencies.jar

COPY entrypoint.sh /
RUN chmod 755 /entrypoint.sh \
    && chown root:root /entrypoint.sh

USER jenkins-slave
VOLUME $HOME

ENTRYPOINT ["/entrypoint.sh"]
