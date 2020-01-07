"""
# Get the source of a specific time series.

    get_source(source_id)

## Arguments

    - `source_id`: an ID, e.g. 1 for "Board of Governors of the Federal Reserve System (US)""

## Examples

```jldoctest
julia> get_source(1)
julia> get_source(3)
julia> get_source(4)
```
"""
function get_source(source_id::Int)

    url = "https://api.stlouisfed.org/fred/source"
    parameters = Dict("api_key" => "8acd2cd4e9a52d3c9984b69deed24617",
                      "file_type" => "json",
                      "source_id" => source_id)

    response = HTTP.request("GET", url; query = parameters)
    results = JSON.parse(String(response.body))["sources"][1]

    return(results)
end
