#!/bin/bash
#
# setup.sh - setup & activate a python virtualenv
#

if [[ -d .venv ]]; then
  source .venv/bin/activate
else
  virtualenv .venv --system-site-packages
  source .venv/bin/activate
fi

# jinja requires markupsafe, but doesn't correctly declared as a requirement
# https://github.com/ansible/ansible/issues/13570
pip install markupsafe ansible==2.2.1.0 ansible-lint netaddr molecule==1.24

# molecule
pip install molecule==1.24 ptyprocess docker

ansible-galaxy --ignore-errors --roles-path=./roles install -r requirements.yml
