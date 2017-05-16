#!/usr/bin/env bash

# This file causes problems with pip
# trying to install in to /lib or /Library
rm -f ~/.pydistutils.cfg

pip3 install bitbucket-cli
pip3 install powerline-status psutil
# pyparsing wheel

# appdirs (1.4.3)
# packaging (16.8)
# pip (9.0.1)
# powerline-status (2.5.2)
# pyparsing (2.2.0)
# setuptools (35.0.1)
# six (1.10.0)
# wheel (0.29.0)
