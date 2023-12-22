module ML
include("lib/NNtrain.jl")
using .NNtrain
using GenieFramework
using DelimitedFiles, Flux, JLD2, PlotlyBase
@genietools

const data = readdlm("data/HousingData_normalized.dlf", ',')
const disable_train = (haskey(ENV, "GENIE_ENV") && ENV["GENIE_ENV"] == "prod") ? "true" : "false"
const button_color = disable_train == "true" ? "grey" : "grey"
const button_tooltip = disable_train == "true" ? tooltip("Run the app locally to enable this button") : ""

@app begin
    @in layer_neurons = [13, 64, 32, 1]
    @in N_train = 320
    @in train = false
    @out training = false
    @in epochs = 100
    @in save = false
    @private model = instantiate_model([13, 64, 32, 1])
    @out train_errors = []
    @out test_errors = []
    @out  traces = [
                   scatter(x=collect(1:100), y=ones(100), name="train")
                   scatter(x=collect(1:100), y=ones(100), name="test")
        ]
    @out layout = PlotlyBase.Layout(
        title="Error vs. epoch",
    )
    @onchange train begin
        training = true
        data_split = train_test_data(data, N_train)
        model, train_errors, test_errors = train_test_network(data_split, layer_neurons, N_train, epochs)
        traces = [
            scatter(x=collect(1:epochs), y=train_errors, name="train")
            scatter(x=collect(1:epochs), y=test_errors, name="test")
        ]
        training = false
    end
    @onchange save begin
        println("Model saved")
        jldsave("models/bostonflux.jld2"; model)
    end
end

#@page("/", "app.jl.html")
#= @page("/", "ui.jl") =#

end


