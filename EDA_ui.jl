header(class="st-header q-pa-sm",
    h1(id="iaj1", draggable="true", class="st-header__title text-h3",
        "Boston housing data EDA"
    )
)
cell(class="row", [
    cell(class="st-col col-4 col-sm st-module", [
        h4("Scatter plot"),
        plot(:scatter_trace, layout=:scatter_layout)
    ]),
    cell(class="st-col col-4 col-sm st-module", [
        h4("Histogram"),
        plot(:hist_trace, layout=:hist_layout)
    ]),
    cell(class="st-col col-4 col-sm st-module", [
        h4("Box plot"),
        plot(:box_trace, layout=:box_layout)
    ])
])
cell(class="row",
    cell(class="st-col col-12 col-sm st-module", [
        h4("Boston housing data"),
        GenieFramework.table(:housing_data; dense=true, flat=true, style="height: 350px;", pagination=:housing_data_pagination)
    ])
)

