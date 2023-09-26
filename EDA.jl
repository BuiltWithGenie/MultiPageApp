module EDA
using GenieFramework
using CSV
using DataFrames
using PlotlyBase

@genietools

const data = CSV.read("data/HousingData.csv", DataFrame, missingstring="NA") |> DataFrame

@app begin end

@page("/", "EDA_ui.jl")
end
