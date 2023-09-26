cell(style="display: flex; justify-content: space-between; align-items: center; background-color: #112244; padding: 10px 50px; color: #ffffff; top: 0; width: 100%; box-sizing: border-box;", [
    cell(style="font-size: 1.5em; font-weight: bold;",
        "Genie workshop"
    ),
    Html.div(style="display: flex; gap: 20px;", [
        a(href="/eda", style="text-decoration: none; color: #ffffff;",
            "Exploratory data analysis"
        ),
        a(href="/ml", style="text-decoration: none; color: #ffffff;",
            "Neural network training"
        ),
        a(href="/api/", target="_blank", style="text-decoration: none; color: #ffffff;",
            "API"
        )
    ])
])
page(model, partial=true, [@yield])
