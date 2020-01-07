"""
# Get the categories for an economic data series in the FRED database.

## Arguments

    - `symbol` : String specifying the name (id) of the time series.

## Examples

```jldoctests
julia> get_category("GDPC1")
julia> get_category("FEDFUNDS")
julia> get_category("T10Y2Y")
```
"""
function get_category(symbol::String)

    url = "https://api.stlouisfed.org/fred/series/categories"
    parameters = Dict("api_key" => "8acd2cd4e9a52d3c9984b69deed24617",
                      "file_type" => "json",
                      "series_id" => symbol)

    response = HTTP.request("GET", url; query = parameters)
    body = JSON.parse(String(response.body))["categories"][1]["name"]

    return(body)
end
