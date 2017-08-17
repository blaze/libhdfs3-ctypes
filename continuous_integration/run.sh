#!/usr/bin/env bash
apt-get update && apt-get install -y -q curl bzip2

if [[ "$TRAVIS_PYTHON_VERSION" == "2.7" ]]; then
 curl https://repo.continuum.io/miniconda/Miniconda-latest-Linux-x86_64.sh -o /tmp/miniconda.sh
else
 curl https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh -o /tmp/miniconda.sh
fi

/bin/bash /tmp/miniconda.sh -b -p /opt/conda
rm /tmp/miniconda.sh

export PATH=/opt/conda/bin:$PATH;
conda install -y -q ipython pytest
conda install -y -q libhdfs3 -c conda-forge
