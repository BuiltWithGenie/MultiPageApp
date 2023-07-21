module ML
using GenieFramework
using DelimitedFiles, Flux, JLD2, PlotlyBase
include("app/NNtrain.jl")
using .NNtrain
@genietools

const data = readdlm("data/HousingData_normalized.dlf", ',')

@app begin
end

@page("/", "app.jl.html")
end
