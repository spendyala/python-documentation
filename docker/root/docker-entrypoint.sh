#!/usr/bin/env bash
set -e

WORKDIR=${WORKDIR:-"/workdir"}

# install the module mounted in $WORKDIR
if [ -e $WORKDIR/setup.py ]; then
    pip install -e $WORKDIR
elif [ -e /home/vpendyala/setup.py ]; then
    pip install -e /home/vpendyala
elif [ -e /home/vpendyala/project/setup.py ]; then
    pip install -e /home/vpendyala/project
fi

HOME=/home/vpendyala
if [ -d "/home/vpendyala/project" ]; then
    exec su -m - vpendyala -c "cd /home/vpendyala/project; $@"
else
    exec su -m - vpendyala -c "cd /home/vpendyala; $@"
fi
