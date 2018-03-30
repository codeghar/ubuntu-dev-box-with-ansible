# Ubuntu Dev Box Setup with Ansible

Different roles to configure various tiny things for a development box setup
on Ubuntu.

Create your own *ansible.cfg* and *hosts* files before proceeding.

Assumes ssh with public key login has been configured with the Ubuntu box.

Configure environment variable with the login user name.

        $ export DEFAULT_REMOTE_USER
        $ DEFAULT_REMOTE_USER=you_user_name

Install Ansible with pipenv.
        $ pipenv install

Notice in *hosts* file in this repo that the Python interpreter is Python 3.
The reason is that I'm using this repo against Ubuntu 18.04 and it has Python 3
installed by default. Ansible is also making progress in supporting Python 3.

Run playbook.

        $ pipenv run ansible-playbook playbook.yml
