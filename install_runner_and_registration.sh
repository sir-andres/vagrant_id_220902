#!/bin/bash

#Add the official GitLab repository for Ubuntu
curl -L "https://packages.gitlab.com/install/repositories/runner/gitlab-runner/script.deb.sh" | sudo bash

#install gitlab-runner
sudo apt-get install -y gitlab-runner

#регистрация раннера
 export GITLABCI_NAME=runner-shell
 export GITLABCI_URL=https://gitlab.com/
 export GITLABCI_TOKEN=GR1348941_KT5QH9GTzB_AG_jkR7d
 export GITLABCI_EXECUTOR=shell
 export GITLABCI_TAGS=''

sudo gitlab-runner register \
	--non-interactive \
	--name "$GITLABCI_NAME" \
	--url "$GITLABCI_URL" \
	--registration-token "$GITLABCI_TOKEN" \
	--executor "$GITLABCI_EXECUTOR" \
	--tag-list "$GITLABCI_TAGS"