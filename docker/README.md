Jenkins slave with docker tools
===============================

Start a [Jenkins swarm](https://wiki.jenkins-ci.org/display/JENKINS/Swarm+Plugin) slave able to pilot docker, this makes it possible to start and stop docker containers from jenkins.

## Start a slave

   `docker run -d -v /var/run/docker.sock:/var/run/docker.sock heliostech/jenkins-slave-docker -master http://jenkins-server/ -username JENKINS_USER -password JENKINS_USER_KEY -executors 2 -labels "docker"`

## Available Options

   Display the available options with the following command:

   `docker run -it --rm heliostech/jenkins-slave-docker -help`


