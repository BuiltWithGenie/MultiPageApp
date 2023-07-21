module EDA
using GenieFramework
using CSV
using DataFrames
using PlotlyBase

@genietools

const data = CSV.read("data/HousingData.csv", DataFrame, missingstring="NA") |> DataFrame

@app begin
    # reactive code goes here
end

@page("/", "app.jl.html")
end
