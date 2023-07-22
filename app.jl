module App
using GenieFramework
@genietools
include("app/EDA/app.jl")
include("app/ML/app.jl")
include("app/API/app.jl")
import .EDA
import .ML
import .API

@page("/eda", "app/EDA/ui.jl", "layout.jl", Main.App.EDA)
@page("/ml", "app/ML/ui.jl", "layout.jl", Main.App.ML)
@page("/api", Main.App.API.ui, nothing)
route("/") do
    redirect(:get_eda)
end
end
