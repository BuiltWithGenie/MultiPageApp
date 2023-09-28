#!/bin/bash
mkdir -p ~/.julia/geniebuilder/apps
ln -s $(pwd) ~/.julia/geniebuilder/apps/genieworkshop
julia -e 'using Pkg; Pkg.activate("."); Pkg.instantiate()'
