## Multipage demo app

A multi-page app including:

- An exploratory data analysis display of a dataset.
- A setup for configuring and training a machine learning model on the data.
- A REST API to serve the model.

![preview](preview.gif)

## Installation

Clone the repository and install the dependencies:

First `cd` into the project directory then run:

```bash
$> julia --project -e 'using Pkg; Pkg.instantiate()'
```

Then run the app

```bash
$> julia --project
```

```julia
julia> using GenieFramework
julia> Genie.loadapp() # load app
julia> up() # start server
```

## Usage

Open your browser and navigate to `http://localhost:8000/`
