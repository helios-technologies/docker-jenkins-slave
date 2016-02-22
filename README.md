Jenkins swarm slave with Java development environment
=====================================================

Start a [Jenkins swarm](https://wiki.jenkins-ci.org/display/JENKINS/Swarm+Plugin) slave into docker with java jdk and maven.

## Start a slave

   docker run -d heliostech/jenkins-swarm-java -master http://jenkins-server/ -username jenkins -password password -executors 2 -labels "linux debian java"


## Available Options

   docker run -it --rm heliostech/jenkins-swarm-java -help

Parameter | Description
----------|------------
-autoDiscoveryAddress VAL      | Use this address for udp-based auto-discovery (default 255.255.255.255)
-candidateTag VAL              | Show swarm candidate with tag only
-description VAL               | Description to be put on the slave
-disableClientsUniqueId        | Disables Clients unique ID.
-disableSslVerification        | Disables SSL verification in the HttpClient.
-executors N                   | Number of executors
-fsroot FILE                   | Directory where Jenkins places files
-help (--help)                 | Show the help screen
-labels VAL                    | Whitespace-separated list of labels to be assigned for this slave. Multiple options are allowed.
-master VAL                    | The complete target Jenkins URL like 'http://server:8080/jenkins/'. If this option is specified, auto-discovery will be skipped
-mode MODE                     | The mode controlling how Jenkins allocates jobs to slaves. Can be either 'normal' (utilize this slave as much as possible) or 'exclusive' (leave this machine for tied jobs only). Default is normal.
-name VAL                      | Name of the slave
-noRetryAfterConnected         | Do not retry if a successful connection gets closed.
-password VAL                  | The Jenkins user password
-passwordEnvVariable VAL       | Environment variable that the password is stored in
-retry N                       | Number of retries before giving up. Unlimited if not specified.
-showHostName (--showHostName) | Show hostnames instead of IP address
-t (--toolLocation)            | A tool location to be defined on this slave. It is specified as 'toolName=location'
-tunnel VAL                    | Connect to the specified host and port, instead of connecting directly to Jenkins. Useful when connection to Hudson needs to be tunneled. Can be also HOST: or :PORT, in which case the missing portion will be auto-configured like the default behavior
-username VAL                  | The Jenkins username for authentication
-t (--toolLocation)            | A tool location to be defined on this slave.
