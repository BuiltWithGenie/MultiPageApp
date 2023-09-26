module App
using GenieFramework
@genietools
include("EDA.jl")
include("ML.jl")
include("API.jl")

@page("/eda", "EDA_ui.jl.html", layout = "layout.jl", model= EDA)
@page("/ml", "ML_ui.jl.html", layout = "layout.jl", model = ML)
route("/api", API.ui)
route("/") do
    redirect(:get_eda)
end
end
