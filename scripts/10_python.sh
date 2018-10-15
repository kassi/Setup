#!/usr/bin/env bash

# Up to now we should have system python installed only!

# This file causes problems with pip
# trying to install in to /lib or /Library
rm -f ~/.pydistutils.cfg

# Following https://medium.com/@henriquebastos/the-definitive-guide-to-setup-my-python-workspace-628d68552e14

brew install pyenv pyenv-virtualenv
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# fetch latest non-dev python 3
py2=$(pyenv install -l | grep "^  2." | grep -v dev | sort | tail -1 | cut -d ' ' -f3)
py3=$(pyenv install -l | grep "^  3." | grep -v dev | sort | tail -1 | cut -d ' ' -f3)

pyenv install $py3
pyenv install $py2

pyenv virtualenv $py3 jupyter3
pyenv virtualenv $py3 tools3
pyenv virtualenv $py2 ipython2
pyenv virtualenv $py2 tools2

pyenv activate jupyter3
pip install --upgrade pip
pip install jupyter
python -m ipykernel install --user
pyenv deactivate

pyenv activate ipython2
pip install --upgrade pip
pip install ipykernel
python -m ipykernel install --user
pyenv deactivate

# Install tools that run on python3
pyenv activate tools3
pip install --upgrade pip
# pip install
pyenv deactivate

# Install tools that run on python2 only
pyenv activate tools2
pip install --upgrade pip
pip install bitbucket-cli
pyenv deactivate

# Esablish path priority
pyenv global $py3 $py2 jupyter3 ipython2 tools3 tools2

# pip3 install bitbucket-cli
# pip3 install powerline-status psutil
# pip3 install Pygments

# appdirs (1.4.3)
# packaging (16.8)
# pip (9.0.1)
# powerline-status (2.5.2)
# pyparsing (2.2.0)
# setuptools (35.0.1)
# six (1.10.0)
# wheel (0.29.0)
