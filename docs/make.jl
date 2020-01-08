VERSION
cd("C:/Users/Markus/.julia/dev/Hausch/")
@__DIR__()
pwd()
using Pkg
Pkg.activate(".")
# now add dependencies in the REPL via "add Module"
dirname(@__FILE__)
using Hausch
using Documenter
using DocumenterLaTeX

cd("C:/Users/Markus/.julia/dev/Hausch/docs/")

makedocs(modules = [Hausch],
        format = Documenter.HTML(assets = ["assets/style.css"], prettyurls = true),
        doctest = false,
        clean = false, # ?
        sitename = "Hausch.jl",
        authors = "Markus Hauschel",
        pages = [
            "Home" => "index.md",
            "Examples" => "examples.md",
            "Getting Started" => "getting_started.md",
            "Types" => "types.md",
            "Functions" => "functions.md",
            "References" => "references.md"
        ])

deploydocs(repo = "C:/Users/Markus/.julia/dev/Hausch/git",
                julia = "1.2.0", osname = "windows")


makedocs(modules = [Hausch],
        format = LaTeX(),
        doctest = false,
        clean = true, # ?
        sitename = "Hausch.jl",
        authors = "Markus Hauschel",
        pages = [
            "Home" => "index.md",
            "Examples" => "examples.md",
            "Getting Started" => "getting_started.md",
            "Types" => "types.md",
            "Functions" => "functions.md",
            "References" => "references.md"
        ])
