#!/bin/bash
mkdir -p ~/.julia/geniebuilder/apps
ln -s $(pwd)/app/EDA ~/.julia/geniebuilder/apps/EDA
ln -s $(pwd)/app/ML ~/.julia/geniebuilder/apps/ML
ln -s $(pwd)/app/API ~/.julia/geniebuilder/apps/API
ln -s $(pwd) ~/.julia/geniebuilder/apps/MultiPage
