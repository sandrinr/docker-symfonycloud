FROM alpine:latest

ENV SYMFONY_CLOUD_SSH_HOST_PUBLIC_KEY git.eu.s5y.io ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCrpeug3uW2t83g2HU40FBsuT1mD+7K6JZY6ayVb/634PNlWa4LtFgUnmv8lXuX6+3aFHXFI+l0OcbUYAe1nN0FTeEfJAVrbWJWC0CATUrMGw8UqU8zpTaVIpLn+nv/kYtRLoJ0EiCcldJh4AIsos2hWqqne/Jo/+jiBiUnQvkcc+hW92hzxs/QWu78TvKKk3zjOFgktHuRThmMYWoFtR2oZLJHVXcH9lrLxRMO1kNCIb4aOeErOI1PXi6lGqlefA8qUlj+vrFlQAobI4yKuUF8a9+IrK2l9UN4eUjhl4MnRmW7YmrxjD7vxhwu7pLtgyvIXf+oYm4chvlEcqFJeEND

RUN set -x && \
  apk add --update --no-cache git openssh-client curl && \
  mkdir /tmp/symfony-cloud-install && \
  curl https://get.symfony.com/cloud/tools.tar.bz2 > /tmp/symfony-cloud-install/tools.tar.bz2 && \
  tar -xf /tmp/symfony-cloud-install/tools.tar.bz2 -C /tmp/symfony-cloud-install && \
  mv /tmp/symfony-cloud-install/symfony /usr/local/bin/symfony && \
  rm -rf /root/.cache /root/.*_history /tmp/symfony-cloud-install

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD ["/bin/sh"]
