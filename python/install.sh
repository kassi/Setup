#!/bin/bash

# This file causes problems with pip
# trying to install in to /lib or /Library
rm ~/.pydistutils.cfg

pip install bitbucket-cli
pip install https://github.com/Lokaltog/powerline/tarball/develop
pip install psutil
pip install pyuv

