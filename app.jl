module App
using GenieFramework
@genietools
include("app/EDA/app.jl")
include("app/ML/app.jl")
include("app/API/app.jl")
import .EDA
import .ML
import .API

@page("/eda", "app/EDA/app.jl.html", "layout.jl.html", Main.App.EDA)
@page("/ml", "app/ML/app.jl.html", "layout.jl.html", Main.App.ML)
@page("/api", Main.App.API.ui, nothing)
route("/") do
    redirect(:get_eda)
end
end
