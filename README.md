Jenkins slaves with various development environments
====================================================

Start a [Jenkins swarm](https://wiki.jenkins-ci.org/display/JENKINS/Swarm+Plugin) slave with various development environments.

## [Oracle Java 8](https://github.com/helios-technologies/docker-jenkins-slave/blob/master/java/8/centos/README.md)

  `docker run -d heliostech/jenkins-slave-java:8 -master http://jenkins-server:port/ -username JENKINS_USER -password JENKINS_USER_KEY -executors 2 -labels "linux java java8"`

## [OpenJDK 8](https://github.com/helios-technologies/docker-jenkins-slave/blob/master/java/8/debian/README.md)

  `docker run -d heliostech/jenkins-slave-java:openjdk8 -master http://jenkins-server:port/ -username JENKINS_USER -password JENKINS_USER_KEY -executors 2 -labels "linux java openjdk8"`

## [Oracle Java 7](https://github.com/helios-technologies/docker-jenkins-slave/blob/master/java/7/centos/README.md)

  `docker run -d heliostech/jenkins-slave-java:7 -master http://jenkins-server:port/ -username JENKINS_USER -password JENKINS_USER_KEY -executors 2 -labels "linux java java7"`

## [NodeJS](https://github.com/helios-technologies/docker-jenkins-slave/blob/master/nodejs/README.md)

  `docker run -d heliostech/jenkins-slave-nodejs -master http://jenkins-server:port/ -username JENKINS_USER -password JENKINS_USER_KEY -executors 2 -labels "linux nodejs"`

## [Ruby](https://github.com/helios-technologies/docker-jenkins-slave/blob/master/ruby/README.md)

  `docker run -d heliostech/jenkins-slave-ruby -master http://jenkins-server:port/ -username JENKINS_USER -password JENKINS_USER_KEY -executors 2 -labels "linux debian ruby"`

## [Ansible](https://github.com/helios-technologies/docker-jenkins-slave/blob/master/ansible/README.md)

  `docker run -d heliostech/jenkins-slave-ansible -master http://jenkins-server:port/ -username JENKINS_USER -password JENKINS_USER_KEY -executors 2 -labels "linux ansible"`

## [C and C++ compilation and development packages](https://github.com/helios-technologies/docker-jenkins-slave/blob/master/gcc/centos/7/README.md)

  `docker run -d heliostech/jenkins-slave-gcc:centos-7 -master http://jenkins-server:port/ -username JENKINS_USER -password JENKINS_USER_KEY -executors 2 -labels "linux centos-7-gcc"`

## [Docker binaries](https://github.com/helios-technologies/docker-jenkins-slave/blob/master/docker/README.md)

  `docker run -d -v /var/run/docker.sock:/var/run/docker.sock heliostech/jenkins-slave-docker -master http://jenkins-server/ -username JENKINS_USER -password JENKINS_USER_KEY -executors 2 -labels "docker"`

## Credits

   Those containers are part of [DevStack](https://www.devstack.com/), a project to facilitate DevOps work with continuous integration and deployment environment ready to use.
