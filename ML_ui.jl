
header(class="st-header q-pa-sm",
    h1(draggable="true", class="st-header__title text-h3",
        "Neural network training"
    )
)
cell(class="row", [
    cell(class="st-col col-6 col-sm st-module", [
        h3("Parameters"),
        p("Layer 1 neurons"),
        slider(1:1:64, Symbol("layer_neurons[2]"); label=true),
        p("Layer 2 neurons"),
        slider(1:1:64, Symbol("layer_neurons[3]"); label=true),
        p("Train samples"),
        slider(1:1:500, :N_train; label=true),
        p("Epochs"),
        slider(1:1:1000, :epochs; label=true),
        br(),
        cell(class="row",
            cell(class="st-col col-6 col-sm", [
                                               btn("TRAIN", class="q-mr-sm", color=button_color, @click("train = !train"), loading=:training, textcolor="black", disable=disable_train,[button_tooltip]),
                                               btn("SAVE", color=button_color, @click("save = !save"),disable=disable_train,[button_tooltip], textcolor="black",)
            ])
        )
    ]),
    cell(class="st-col col-6 col-sm st-module",
        plot(:traces, layout=:layout)
    )
])
