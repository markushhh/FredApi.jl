"""
# Download data from FRED

    get_symbols(symbol)

## Arguments

    - `symbol`: symbol, e.g. "GDPC1" or "FEDFUNDS"

## Examples

```jldoctest
julia> get_symbols("GDPC1")
julia> get_symbols("FEDFUNDS")
julia> get_symbols("T10Y2Y")
```
"""
function get_symbols(symbol::String)

    url = "https://api.stlouisfed.org/fred/series/observations"
    parameters = Dict("api_key" => "8acd2cd4e9a52d3c9984b69deed24617",
                    "file_type" => "json",
                    "series_id" => symbol)

    response = HTTP.request("GET", url; query = parameters)
    observations = JSON.parse(String(response.body))["observations"]

    time = Dates.Date.([observations[i]["date"] for i ∈ eachindex(observations)])
    observations = [observations[i]["value"] for i ∈ eachindex(observations)]

    index_missing = findall(x -> x == ".", observations)
    deleteat!(observations, index_missing)
    deleteat!(time, index_missing)

    x = DataFrame(
        Value = [parse(Float64, observations[i]) for i ∈ eachindex(observations)],
        Time = time
    )

    x = TimeArray(x, timestamp = :Time)
    return(x)
end

"""
# Download data from FRED

    get_symbols(symbol, start_interval, end_interval)

## Arguments

    - `symbol`: symbol, e.g. "GDPC1" or "FEDFUNDS"
    - `f` : Date character, e.g. "2018-12-13" in the form of "YYYY-MM-DD"
    - `t` : Date character, e.g. "2019-12-13" in the form of "YYYY-MM-DD"

## Examples

```jldoctest
julia> get_symbols("GDPC1", "2010-01-01", "2019-01-01")
julia> get_symbols("FEDFUNDS", "2000-01-01", "2019-01-01")
julia> get_symbols("T10Y2Y", "2000-01-01", "2019-01-01")
```
"""
function get_symbols(symbol::String, start_interval::String, end_interval::String)

    x = get_symbols(symbol::String)

    x = from(x, Date(start_interval))
    x = to(x, Date(end_interval))

    return(x)
end
