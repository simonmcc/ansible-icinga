#!/bin/bash -x
#
# setup.sh - setup & activate a python virtualenv
#

# ensure we have a viable python environment
PYTHON=$(which python)
PIP=$(which pip)
VIRTUALENV=$(which virtualenv)

if [[ -z "${PYTHON}" ]] ; then
  echo "No trace of python found - all hope is lost"
  exit 1
fi

if [[ -z "${PIP}" ]] ; then
  echo "Installing pip via get-pip.py (no root access, --prefix=${PWD}/.local)"
  if [ "${_system_name}" == 'OSX' -o $(uname) == "Darwin" ]; then
    export PATH=${HOME}/Library/Python/2.7/bin:${PATH}
  else
    export PATH=${PWD}/.local/bin:${PATH}
  fi
  wget -O get-pip.py https://bootstrap.pypa.io/get-pip.py
  python get-pip.py --user
  PIP=$(which pip)
fi

if [[ -z "${VIRTUALENV}" ]] && [[ -n "${PIP}" ]] ; then
  echo "Installing virtualenv via pip..."
  pip install --prefix=${PWD}/.local virtualenv
fi

if [[ -d .venv ]]; then
  source .venv/bin/activate
else
  virtualenv .venv --system-site-packages
  source .venv/bin/activate
fi

# jinja requires markupsafe, but doesn't correctly declared as a requirement
# https://github.com/ansible/ansible/issues/13570
pip install markupsafe ansible ansible-lint netaddr

# molecule
# pip install molecule==1.24 ptyprocess docker

ansible-galaxy --ignore-errors --roles-path=./roles install -r requirements.yml
