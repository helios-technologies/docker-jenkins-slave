Jenkins slave with docker tools
===============================

Start a [Jenkins swarm](https://wiki.jenkins-ci.org/display/JENKINS/Swarm+Plugin) slave able to pilot docker, this makes it possible to start and stop docker containers from jenkins.

## Start a slave

   `docker run -d -v /var/run/docker.sock:/var/run/docker.sock heliostech/jenkins-slave-docker -master http://jenkins-server/ -username JENKINS_USER -password JENKINS_USER_KEY -executors 2 -labels "docker"`

## Use a specific API version
You must use a client with the same API version than your docker server.
For each API version a corresponding tag has been created for this image.
You can use a specific version this way:
    `docker run heliostech/jenkins-slavedocker:1.22`

Use the table below to find the API version for a Docker version:

|Docker version |API version|
|---------------|-----------|
|1.11.x         |1.23       |
|1.10.x         |1.22       |
|1.9.x          |1.21       |
|1.8.x          |1.20       |
|1.7.x          |1.19       |
|1.6.x          |1.18       |

## Available Options

   Display the available options with the following command:

   `docker run -it --rm heliostech/jenkins-slave-docker -help`


## Credits

   This container is part of [DevStack](https://www.devstack.com/), a project to facilitate DevOps work with continuous integration and deployment environment ready to use.
