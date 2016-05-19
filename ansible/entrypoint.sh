#!/bin/bash

if [[ $# -lt 1 ]] || [[ "$1" == "-"* ]]; then
  echo Running java ${JAVA_OPTS} -jar "${JENKINS_SWARM_JAR}" -fsroot $HOME "$@"
  exec java ${JAVA_OPTS} -jar "${JENKINS_SWARM_JAR}" -fsroot $HOME "$@"
fi

exec "$@"
