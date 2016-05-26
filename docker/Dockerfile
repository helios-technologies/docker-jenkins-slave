FROM debian:jessie

MAINTAINER Camille Meulien <cmeulien@heliostech.fr>

ENV HOME=/home/jenkins-slave \
    JENKINS_SWARM_VERSION=2.0 \
    JENKINS_SWARM_JAR_PATH=/usr/share/jenkins

ENV JENKINS_SWARM_JAR=${JENKINS_SWARM_JAR_PATH}/swarm-client-${JENKINS_SWARM_VERSION}-jar-with-dependencies.jar

RUN apt-get update \
    && apt-get install -y openjdk-7-jre-headless apt-transport-https ca-certificates \
    && apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D \
    && echo deb https://apt.dockerproject.org/repo debian-jessie main > /etc/apt/sources.list.d/docker.list \
    && apt-get update \
    && apt-get install -y docker-engine

RUN set -x \
    && apt-get install -y curl \
    && useradd -d ${HOME} -m jenkins-slave \
    && mkdir -p ${JENKINS_SWARM_JAR_PATH} \
    && chmod 755 ${JENKINS_SWARM_JAR_PATH} \
    && curl -sSLo ${JENKINS_SWARM_JAR} http://maven.jenkins-ci.org/content/repositories/releases/org/jenkins-ci/plugins/swarm-client/${JENKINS_SWARM_VERSION}/swarm-client-${JENKINS_SWARM_VERSION}-jar-with-dependencies.jar

RUN env | grep -E "(JENKINS|JAVA)" > /etc/docker.properties

COPY entrypoint.sh /
RUN chmod 755 /entrypoint.sh \
    && chown root:root /entrypoint.sh

USER jenkins-slave

VOLUME $HOME
ENTRYPOINT ["/entrypoint.sh"]
