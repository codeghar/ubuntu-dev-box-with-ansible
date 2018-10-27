# Ubuntu Dev Box Setup with Ansible

Different roles to configure various tiny things for a development box setup
on Ubuntu.

Modify *ansible.cfg* and *hosts* files before proceeding.

Assumes ssh with public key login has been configured with the Ubuntu box.

Configure environment variable with the login user name ((source](https://docs.ansible.com/ansible/2.7/reference_appendices/config.html#envvar-ANSIBLE_REMOTE_USER)).

        $ export ANSIBLE_REMOTE_USER
        $ ANSIBLE_REMOTE_USER=your_user_name

If you have installed direnv, you can put the above in .envrc.

Install Ansible with pipenv.

        $ make init

Notice in *hosts* file in this repo that the Python interpreter is Python 3.
The reason is that I'm using this repo against Ubuntu 18.04 and it has Python 3
installed by default. Ansible is also making progress in supporting Python 3.

## Desktop

        $ make desktop

You'll notice in _Makefile_ that DOCKER_DATA_ROOT environment variable is used
but it's set to the default value from [Docker docs](https://docs.docker.com/engine/reference/commandline/dockerd/#run-multiple-daemons).
I override the default value in the playbook by setting this environment
variable but the value is not stored in git. Instead, I use direnv and its
.envrc file to set this value. This way my customizations don't pollute this
repo while also showing how I do it (except my .envrc is not added to git).

I track https://github.com/aikchar/new-mac for configuring bash. For this
reason, a helper ``make`` target, _bash-refresh_, has been added. It clones
that repo and copies over files from the clone to _roles/bash/files_. This way
local copies can be easily refreshed with upstream changes.

## Unifi

        $ make unifi

Installs Unifi controller. I had a hard time installing it on Ubuntu 18.04 so
I have limited it to Ubuntu 16.04 only.
