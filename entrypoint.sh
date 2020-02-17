#!/usr/bin/env sh

set -e

if [[ -n "$SYMFONY_CLOUD_SSH_HOST_PUBLIC_KEY" ]]; then
	mkdir -p ~/.ssh
	chmod 0700 ~/.ssh
	echo "$SYMFONY_CLOUD_SSH_HOST_PUBLIC_KEY" >>  ~/.ssh/known_hosts
fi

if [[ -n "$SYMFONY_CLOUD_SSH_KEY" ]]; then
	eval $(ssh-agent -s)
	echo "${SYMFONY_CLOUD_SSH_KEY}" | base64 -d | ssh-add -
fi

exec "$@"
