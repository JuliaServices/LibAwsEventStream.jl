using LibAwsEventStream
using Documenter

DocMeta.setdocmeta!(LibAwsEventStream, :DocTestSetup, :(using LibAwsEventStream); recursive=true)

makedocs(;
    modules=[LibAwsEventStream],
    repo="https://github.com/JuliaServices/LibAwsEventStream.jl/blob/{commit}{path}#{line}",
    sitename="LibAwsEventStream.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://github.com/JuliaServices/LibAwsEventStream.jl",
        assets=String[],
        size_threshold=2_000_000, # 2 MB, we generate about 1 MB page
        size_threshold_warn=2_000_000,
    ),
    pages=["Home" => "index.md"],
)

deploydocs(; repo="github.com/JuliaServices/LibAwsEventStream.jl", devbranch="main")
