#!/bin/bash

mkdir -p ~/miniconda3
bash ~/miniconda.sh -b -u -p ~/miniconda3

cd ~/miniconda3/bin
./conda init bash

./conda clean --tarballs
