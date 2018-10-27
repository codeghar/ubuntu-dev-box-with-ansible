DOCKER_DATA_ROOT ?= /var/lib/docker

.PHONY: init
init:
	pipenv install

.PHONY: desktop
desktop:
	pipenv run ansible-playbook --extra-vars docker_data_root=$(DOCKER_DATA_ROOT) playbook.yml

.PHONY: unifi
unifi:
	pipenv run ansible-playbook playbook-unifi.yml

# Grabs the latest changes from github.com/aikchar/new-mac from its bash directory
# and pushes them to the role
.PHONY: bash-refresh
bash-refresh: | /tmp/new-mac
	cp /tmp/new-mac/bash/env roles/bash/files/env
	cp /tmp/new-mac/bash/interactive roles/bash/files/interactive
	cp /tmp/new-mac/bash/login roles/bash/files/login
	cp /tmp/new-mac/bash/logout roles/bash/files/logout
	cp /tmp/new-mac/bash/bash_logout roles/bash/files/bash_logout
	cp /tmp/new-mac/bash/bash_profile roles/bash/files/bash_profile
	cp /tmp/new-mac/bash/bashrc roles/bash/files/bashrc
	cp /tmp/new-mac/bash/profile roles/bash/files/profile

/tmp/new-mac:
	(cd /tmp/new-mac && git pull) || git clone https://github.com/aikchar/new-mac.git /tmp/new-mac
