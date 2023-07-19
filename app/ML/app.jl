module ML
using PlotlyBase
include("app/NNtrain.jl")
using .NNtrain
using GenieFramework
using JLD2
@genietools

data_path = "data/HousingData_normalized.dlf"
model = []

@app begin
    @in layer_neurons = [13, 64, 32, 1]
    @in N_train = 320
    @in train = false
    @in training = false
    @in epochs = 100
    @in save = false
    @private model = instantiate_model([13, 64, 32, 1])
    @out train_errors = []
    @out test_errors = []
    @out traces = []
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
        # BSON.save("models/bostonflux.bson", model)
        jldsave("models/bostonflux.jld2"; model)
    end
end

@page("/","app.jl.html")

end

