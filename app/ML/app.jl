module ML
using PlotlyBase
include("app/NNtrain.jl")
using .NNtrain
using GenieFramework
using BSON: @save, @load
@genietools

data_path = "data/HousingData_normalized.dlf"
model = []

@app begin
    @in layer_neurons = [13,64,50,1]
    @in N_train = 320
    @in train = false
    @in training = false
    @in epochs = 1000
    @in save = false
    @out train_errors = []
    @out test_errors = []
    @out traces = []
    @out layout = PlotlyBase.Layout(
        title="Error vs. epoch",
    )
    @onchange train begin
        @show "Training"
        training = true
        model, train_errors, test_errors=train_network(data_path, layer_neurons, N_train, epochs)
        traces = [
                  scatter(x=collect(1:epochs), y=train_errors, name="train")
                  scatter(x=collect(1:epochs), y=test_errors, name="test")
                 ]
        training = false
        save = true
    end
    @onchange save begin
        println("Model saved")
        @save "models/bostonflux.bson" model
        save = false
    end
end

@page("/","app.jl.html")

end

