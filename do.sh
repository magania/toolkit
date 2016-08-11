#!/bin/bash

chmod u+x anaconda.sh jupyter_config.sh &&
./anaconda.sh &&
export PATH=${HOME}/anaconda3/bin:${PATH} &&
./jupyter_config.sh &&
echo "Run jupyther-notebook"
