#!/bin/bash

# This file causes problems with pip
# trying to install in to /lib or /Library
rm ~/.pydistutils.cfg

pip install bitbucket-cli
pip install git+git://github.com/Lokaltog/powerline
pip install psutil
pip install git+git://github.com/saghul/pyuv@v0.10
