mkdir -p ~/.julia/geniebuilder
ln -s app/EDA/ ~/.julia/geniebuilder/EDA
ln -s app/ML/ ~/.julia/geniebuilder/ML
ln -s app/API/ ~/.julia/geniebuilder/API
ln -s . ~/.julia/geniebuilder/MultiPage
julia --startup-file=no --depwarn=no /home/vscode/.vscode-remote/extensions/geniebuilder.geniebuilder-0.4.10/scripts/rungb.jl
