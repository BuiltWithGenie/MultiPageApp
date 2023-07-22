mkdir -p ~/.julia/geniebuilder
ln -s /workspaces/MultiPageApp/app/EDA/ ~/.julia/geniebuilder/EDA
ln -s /workspaces/MultiPageApp/app/ML/ ~/.julia/geniebuilder/ML
ln -s /workspaces/MultiPageApp/app/API/ ~/.julia/geniebuilder/API
ln -s /workspaces/MultiPageApp ~/.julia/geniebuilder/MultiPage
cd /workspaces/MultiPageApp && julia -e "using Pkg; Pkg.instantiate()"
cd /workspaces/MultiPageApp/app/EDA && julia -e 'using Pkg; Pkg.activate("."); Pkg.instantiate()'
cd /workspaces/MultiPageApp/app/ML && julia -e 'using Pkg; Pkg.activate("."); Pkg.instantiate()'
cd /workspaces/MultiPageApp/app/API && julia -e 'using Pkg; Pkg.activate("."); Pkg.instantiate()'
