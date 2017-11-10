Docker image with Oracle JDK prepared to run Java applications.

**hk/oraclejdk**

Based on debian

Versions so far:

| Version | Other tags | From       |
| ------- | ---------- | ---------- |
| 8u151   | 8, latest  | Debian:9.2 |

Commands to build last version:

``` sh
$ docker build --force-rm --rm=true --squash -t nexus.hawkore.com/repository/docker/hk/oraclejdk:8u151 .
$ docker tag nexus.hawkore.com/repository/docker/hk/oraclejdk:8u151 nexus.hawkore.com/repository/docker/hk/oraclejdk:8
$ docker tag nexus.hawkore.com/repository/docker/hk/oraclejdk:8u151 nexus.hawkore.com/repository/docker/hk/oraclejdk:latest
```