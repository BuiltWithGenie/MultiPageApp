module API
using Genie
using Genie.Renderers.Json: json
using Flux, DataFrames, JLD2, DelimitedFiles
using SwagUI, SwaggerMarkdown

const data = readdlm("data/HousingData_normalized.dlf", ',')
model = JLD2.load("models/bostonflux.jld2", "model")

function predict()
    house = data[params(:id), 1:13]
    @show house
    json("MEDV" => model(house))
end

@swagger """
/api/predict/{id}:
  get:
    description: Predict the MEDV of a house.
    parameters:
      - in: path
        name: id
        required: true
        description: Numeric ID of the house to get the prediction.
        schema:
           type: integer
    responses:
      '200':
        description: OK
"""
route("/api/predict/:id::Int", predict, method=GET)

@swagger """
/api/reload:
  get:
    description: Reload the neural network model.
    responses:
      '200':
        description: OK
"""
route("/api/reload") do
    model = JLD2.load("models/bostonflux.jld2", "model")
    "Model reloaded"
end

info = Dict{String,Any}()
info["title"] = "Boston housing MEDV prediction"
info["version"] = "1.0.5"
optional_fields = Dict{String,Any}()
if haskey(ENV, "BASEPATH")
    optional_fields["servers"] = [Dict("url" => ENV["BASEPATH"])]
end
openApi = OpenAPI("3.0", info, optional_fields=optional_fields)
swagger_document = build(openApi)

ui() = render_swagger(swagger_document)

end

