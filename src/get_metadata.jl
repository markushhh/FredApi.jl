"""
# Get information about a time series in the FRED database.

    get_metadata(symbol)

## Arguments

    - `symbol` : String specifying the name (id) of the time series.

## Examples

```jldoctest
julia> get_metadata("GDPC1")
julia> get_metadata("FEDFUNDS")
julia> get_metadata("T10Y2Y")
```
"""
function get_metadata(symbol::String)

    url = "https://api.stlouisfed.org/fred/series"

    parameters = Dict("api_key" => "8acd2cd4e9a52d3c9984b69deed24617",
                      "file_type" => "json",
                      "series_id" => symbol)

    response = HTTP.request("GET", url; query = parameters)
    results = JSON.parse(String(response.body))["seriess"][1]

    println("")
    println("Metadata for: " * symbol)
    println("Title: " * results["title"])
    println("Units: " * results["units"])
    println("Adjustment: " * results["seasonal_adjustment"])
    println("Frequency: " * results["frequency"])
    println("Notes: " * results["notes"])

    return(results)
end
