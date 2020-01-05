__precompile__()

module FredApi

export
    get_symbols

using DataFrames
using TimeSeries
using Dates
import HTTP
import JSON

include("get_symbols.jl")

end
