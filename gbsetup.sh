mkdir -p ~/.julia/geniebuilder/apps
ln -s $(pwd)/app/EDA ~/.julia/geniebuilder/apps/EDA
ln -s $(pwd)/app/ML ~/.julia/geniebuilder/apps/ML
ln -s $(pwd)/app/API ~/.julia/geniebuilder/apps/API
ln -s $(pwd) ~/.julia/geniebuilder/apps/MultiPage
cd ~/.julia/geniebuilder/apps/EDA && julia -e 'using Pkg; Pkg.activate("."); Pkg.instantiate()'
cd ~/.julia/geniebuilder/apps/ML && julia -e 'using Pkg; Pkg.activate("."); Pkg.instantiate()'
cd ~/.julia/geniebuilder/apps/API && julia -e 'using Pkg; Pkg.activate("."); Pkg.instantiate()'
