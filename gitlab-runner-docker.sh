#!/bin/bash

 export GITLABCI_NAME=runner-docker
 export GITLABCI_URL=https://gitlab.com/
 export GITLABCI_TOKEN=YOUR_TOKEN
 export GITLABCI_EXECUTOR=docker
 export GITLABCI_TAGS='docker'

#добавить gitlab-runner в группу docker
sudo usermod -aG docker gitlab-runner

#остановить и удалить контейнер с раннером, если он уже существует
docker stop gitlab-runner
docker rm gitlab-runner

#запуск раннера
docker run -d --name gitlab-runner --restart always \
   -v /srv/gitlab-runner/config:/etc/gitlab-runner \
   -v /var/run/docker.sock:/var/run/docker.sock \
   gitlab/gitlab-runner:latest

#регистрация раннера
docker run --rm -v /srv/gitlab-runner/config:/etc/gitlab-runner gitlab/gitlab-runner register \
	--non-interactive \
	--name "$GITLABCI_NAME" \
	--url "$GITLABCI_URL" \
	--registration-token "$GITLABCI_TOKEN" \
	--executor "$GITLABCI_EXECUTOR" \
	--tag-list "$GITLABCI_TAGS" \
	--docker-image ubuntu
