using IntensityMetrics
using Documenter

DocMeta.setdocmeta!(IntensityMetrics, :DocTestSetup, :(using IntensityMetrics); recursive=true)

makedocs(;
    modules=[IntensityMetrics],
    authors="Morten F. Rasmussen <10264458+mofii@users.noreply.github.com> and contributors",
    repo="https://github.com/mofii/IntensityMetrics.jl/blob/{commit}{path}#{line}",
    sitename="IntensityMetrics.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://mofii.github.io/IntensityMetrics.jl",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/mofii/IntensityMetrics.jl",
)
