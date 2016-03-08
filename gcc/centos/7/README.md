Jenkins slave with C and C++ development environment
=====================================================

Start a [Jenkins swarm](https://wiki.jenkins-ci.org/display/JENKINS/Swarm+Plugin) slave into docker with development environment to compile C and C++ with x86_64 and i686 libraries.

## Start a slave

   `docker run -d heliostech/jenkins-slave-gcc:centos-7 -master http://jenkins-server/ -username JENKINS_USER -password JENKINS_USER_KEY -executors 2 -labels "linux centos-7-gcc"`


## Available Options

   Display the available options with the following command:

   `docker run -it --rm heliostech/jenkins-slave-gcc:centos-7 -help`


