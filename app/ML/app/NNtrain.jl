module NNtrain
using Flux, Random, Statistics, CSV, DataFrames
using DelimitedFiles: readdlm, writedlm
using Flux: @epochs, throttle

export normalize_data, train_test_data, train_network

# Read data, normalize it, and save the normalized data
function normalize_data(input_file_path::String, output_file_path::String)
    df = CSV.read(input_file_path, DataFrame, missingstring="NA")
    dropmissing!(df)
    data = Matrix(df)
    data = (data .- mean(data, dims=1)) ./ std(data, dims=1)
    writedlm(output_file_path, data, ',')
    return data
end

# Split data into train and test sets
function train_test_data(data::Matrix, N_train::Int; target_index::Int=14)
    target = data[:, target_index]
    features = data[:, setdiff(1:size(data, 2), target_index)]

    if N_train > length(target)
        error("N_train cannot be greater than the size of the dataset.")
    end

    # Randomly select indices for the training set
    Random.seed!(1)
    train_idx = randperm(length(target))[1:N_train]
    test_idx = setdiff(1:length(target), train_idx)
    # Subset the features and targets for training and testing
    x_train = features[train_idx, :]
    x_test = features[test_idx, :]
    y_train = target[train_idx, :]
    y_test = target[test_idx, :]

    return x_train', x_test', y_train', y_test'
end

function train_network(data_path::String, layer_neurons::Vector{Int}, N_train::Int, epochs::Int)
    # Define the model architecture
    model = Chain(
        Dense(layer_neurons[1], layer_neurons[2], relu),
        Dense(layer_neurons[2], layer_neurons[3], relu),
        Dense(layer_neurons[3], 1)
    )

    # Define the optimizer
    opt = ADAM()

    # Define the loss function
    loss(x, y) = Flux.Losses.mse(model(x), y)

    # Define the parameters to optimize and training data
    parameters = Flux.params(model)
    x_train, x_test, y_train, y_test = train_test_data(readdlm(data_path, ','), N_train)
    data = [(x_train, y_train)]

    # Define a callback to record the loss at each epoch
    train_errors = []
    test_errors = []
    evalcb = () -> begin
        push!(train_errors, loss(x_train, y_train))
        push!(test_errors, loss(x_test, y_test))
    end

    # Train the model using the defined loss function, parameters, data, and optimizer
    @epochs epochs Flux.train!(loss, parameters, data, opt, cb=evalcb)

    # Return the trained model
    return model, train_errors, test_errors
end
end
