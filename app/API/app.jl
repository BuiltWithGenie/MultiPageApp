module API
using GenieFramework
using GenieFramework.Genie.Renderers.Json: json
using Flux, DataFrames, JLD2, DelimitedFiles
using SwagUI, SwaggerMarkdown

const data = readdlm("data/HousingData_normalized.dlf", ',')
model = JLD2.load("models/bostonflux.jld2", "model")

end

