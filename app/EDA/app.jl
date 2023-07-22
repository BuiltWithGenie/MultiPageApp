module EDA
using GenieFramework
using CSV
using DataFrames
using PlotlyBase

@genietools

const data = CSV.read("data/HousingData.csv", DataFrame, missingstring="NA") |> DataFrame

@app begin
    @out housing_data = DataTable(data)
    @out housing_data_pagination = DataTablePagination(rows_per_page=10)

    # Scatter Plot
    @out scatter_trace = [scatter(
        x=data[:, "RM"],
        y=data[:, "MEDV"],
        mode="markers",
        marker=attr(size=10, color="rgba(255, 182, 193, .9)"),
        name="Rooms vs MEDV"
    )]
    @out scatter_layout = PlotlyBase.Layout(
        xaxis_title="Rooms",
        yaxis_title="MEDV"
    )

    #
    # Histogram
    @out hist_trace = [histogram(x=data[:, "MEDV"], name="Median Value Distribution")]
    @out hist_layout = PlotlyBase.Layout(
        xaxis_title="MEDV",
        yaxis_title="Count"
    )

    # Box Plot
    @out box_trace = [box(y=data[:, "MEDV"], name="Boston")]
    @out box_layout = PlotlyBase.Layout(
        yaxis_title="MEDV"
    )
end

# @page("/", "app.jl.html")
@page("/", "ui.jl")
end
