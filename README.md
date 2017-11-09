Docker image with Oracle JDK prepared to run Java applications.

**hk/oraclejdk**

Based on debian

Versions so far:

| Version | Other tags | From       |
| ------- | ---------- | ---------- |
| 8u151   | 8, latest  | Debian:9.2 |

Commands to build last version:

``` sh
$ docker build --force-rm --rm=true --squash -t hk/oraclejdk:8u151 .
$ docker tag hk/oraclejdk:8u151 hk/oraclejdk:8
$ docker tag hk/oraclejdk:8u151 hk/oraclejdk:latest
```