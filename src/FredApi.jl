__precompile__()

module FredApi

export
    get_symbols,
    search_symbol,
    get_release,
    get_metadata,
    get_category,
    get_sources,
    get_source

using DataFrames
using TimeSeries
using Dates
using HTTP
using JSON

include("get_symbols.jl")
include("search_symbol.jl")
include("get_release.jl")
include("get_metadata.jl")
include("get_category.jl")
include("get_sources.jl")
include("get_source.jl")

end
