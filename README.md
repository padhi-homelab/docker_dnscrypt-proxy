# docker_dnscrypt-proxy <a href='https://github.com/padhi-homelab/docker_dnscrypt-proxy/actions?query=workflow%3A%22Docker+CI+Release%22'><img align='right' src='https://img.shields.io/github/workflow/status/padhi-homelab/docker_dnscrypt-proxy/Docker%20CI%20Release?logo=github&logoWidth=24&style=flat-square'></img></a>

<a href='https://hub.docker.com/r/padhihomelab/dnscrypt-proxy'><img src='https://img.shields.io/docker/image-size/padhihomelab/dnscrypt-proxy/latest?label=size%20%5Blatest%5D&logo=docker&logoWidth=24&style=for-the-badge'></img></a>
<a href='https://hub.docker.com/r/padhihomelab/dnscrypt-proxy'><img src='https://img.shields.io/docker/image-size/padhihomelab/dnscrypt-proxy/testing?label=size%20%5Btesting%5D&logo=docker&logoWidth=24&style=for-the-badge'></img></a>


A multiarch dnscrypt-proxy Docker image, based on [Alpine Linux].

|        386         |       amd64        |       arm/v6       |       arm/v7       |       arm64        |      ppc64le       |       s390x        |
| :----------------: | :----------------: | :----------------: | :----------------: | :----------------: | :----------------: | :----------------: |
| :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: |


## Usage

```
docker run --detach \
           -p 8053:8053 \
           -it padhihomelab/dnscrypt-proxy
```

Runs `dnscrypt-proxy` server on port 8053.

_<More details to be added soon>_


[Alpine Linux]: https://alpinelinux.org/
