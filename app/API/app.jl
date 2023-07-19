module API
using GenieFramework.Genie.Renderers.Json: json
using GenieFramework
using CSV, Flux, DataFrames, NNlib, JLD2
using SwagUI
using SwaggerMarkdown

data = CSV.read("data/HousingData.csv", DataFrame, missingstring="NA")
model = JLD2.load("models/bostonflux.jld2", "model")

function predict()
    house = Vector(data[params(:id), 1:13])
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
    model = BSON.load("models/bostonflux.bson", @__MODULE__)[:model]
    "Model reloaded"
end

info = Dict{String,Any}()
info["title"] = "Boston housing MEDV prediction"
info["version"] = "1.0.5"
openApi = OpenAPI("3.0", info)
swagger_document = build(openApi)

ui() = render_swagger(swagger_document)

@page("/api", ui)
end

