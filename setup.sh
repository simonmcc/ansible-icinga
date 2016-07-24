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

pip install --quiet ansible ansible-lint netaddr

ansible-galaxy --ignore-errors --roles-path=./roles install -r requirements.yml
