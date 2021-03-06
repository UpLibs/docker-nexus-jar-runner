# Docker Jar Runner

This image was designed to allow the easy deployment of an standalone Java applications (*cough* microservices *cough*) on a very lightweight container, based on [Alpine Linux](http://www.alpinelinux.org/).

Provided some environment variable, docker-jar-runner is capable of downloading a distribution (zip or jar), from a [Nexus](http://www.sonatype.org/nexus/) repository manager or [Azure](https://azure.microsoft.com/en-us/documentation/services/storage/) storage service, and runnning it.

Zip files are currently only supported for distributions generated by [Gradle](http://gradle.org/getting-started-gradle/)'s [distZip task](https://docs.gradle.org/current/userguide/application_plugin.html#N16103)

## Necessary Environment Variables

### Storage-related
- $STORAGE_TYPE = Indicates if the artifact is stored on 'nexus' or 'azure'
- $STORAGE_ACCOUNT = This can be a Nexus user's name or an Azure storage account's name
- $STORAGE_PASSWORD = This is the Nexus user's password or the  Azure storage account's access key
- $STORAGE_REPOSITORY = This is the Nexus's repository's name or the Azure storage account's container's name

### Nexus-related
- $NEXUS_URL = Nexus' base URL

### Artifact-related
- $ARTIFACT_GROUP = The artifact's group. Not necessary when downloading from Azure
- $ARTIFACT_NAME = The artifact's name.
- $ARTIFACT_VERSION = The artifact's version to be downloaded
- $ARTIFACT_EXTENSION = The artifact's file extension. Should be 'jar' or 'zip'.

## Optional Environment Variables
- $JAVA_OPTS = Extra Java options to be declared when running the distribution
- $ARGS = Arguments to be passed to the distribution
- Any other environment variable you might want to set in your environment

## How to run

Simply execute the following docker run commands, replacing the placeholder values of the environment variables

- For artifacts stored on Nexus:
```
docker run -p 8080:8080 -e STORAGE_TYPE=nexus -e STORAGE_ACCOUNT=username -e STORAGE_PASSWORD=userpassword -e STORAGE_REPOSITORY=releases -e NEXUS_URL=http://nexus.domain.com -e ARTIFACT_GROUP=com.domain -e ARTIFACT_NAME=your-artifact-name -e ARTIFACT_VERSION=the-desired-version -e ARTIFACT_EXTENSION=zip -e YOUR_PROPERTY=prop-value uppoints/docker-jar-runner
```

- For artifacts stored on Azure:
```
docker run -p 8080:8080 -e STORAGE_TYPE=azure -e STORAGE_ACCOUNT=accountname -e STORAGE_PASSWORD=accountkey -e STORAGE_REPOSITORY=container-name -e ARTIFACT_NAME=your-artifact-name -e ARTIFACT_VERSION=the-desired-version -e ARTIFACT_EXTENSION=zip -e YOUR_PROPERTY=prop-value uppoints/docker-jar-runner
```
