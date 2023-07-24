#!/bin/bash
CURRENT_DIR=$(pwd)
cd $CURRENT_DIR/app/EDA && julia -e 'using Pkg; Pkg.activate("."); Pkg.instantiate()'
cd $CURRENT_DIR/app/ML && julia -e 'using Pkg; Pkg.activate("."); Pkg.instantiate()'
cd $CURRENT_DIR/app/API && julia -e 'using Pkg; Pkg.activate("."); Pkg.instantiate()'
