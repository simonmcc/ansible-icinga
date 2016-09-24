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
pip install markupsafe ansible ansible-lint netaddr

ansible-galaxy --ignore-errors --roles-path=./roles install -r requirements.yml
