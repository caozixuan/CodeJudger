#! /bin/bash

set -ex
dir=$PWD

cd ../dist
rm -rf build
python3 setup.py install
cd $dir/test_suite && python3 test.py
