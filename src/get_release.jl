"""

# Get release information for an economic data series in the FRED database.

    get_release(symbol)

## Arguments

    - `symbol` : String specifying the name (id) of the time series.

## Examples

```jldoctest
julia> get_release("GDPC1")
julia> get_release("FEDFUNDS")
julia> get_release("T10Y2Y")
```
"""
function get_release(symbol::String)

    url = "https://api.stlouisfed.org/fred/series/release"
    parameters = Dict("api_key" => ENV["API_FRED"],
                      "file_type" => "json",
                      "series_id" => symbol)

    response = HTTP.request("GET", url; query = parameters)
    body = JSON.parse(String(response.body))["releases"][1]

    return(body)
end
