"""
# Get all sources of economic data.

    get_sources()

## Examples

```jldoctest
julia> x = get_sources()
julia> println(x)
```
"""
function get_sources()

    url = "https://api.stlouisfed.org/fred/sources"
    parameters = Dict("api_key" => ENV["API_FRED"],
                      "file_type" => "json")

    response = HTTP.request("GET", url; query = parameters)
    results = JSON.parse(String(response.body))["sources"]

    v_keys = ["link" in keys(results[i]) for i ∈ eachindex(results)]
    link = Any["" for i ∈ eachindex(results)]
    for i ∈ eachindex(results)
        if v_keys[i] == true
            link[i] = results[i]["link"]
        else
            link[i] = missing
        end
    end

    x = DataFrame(
        id = [results[i]["id"] for i ∈ eachindex(results)],
        name = [results[i]["name"] for i ∈ eachindex(results)],
        link = link
    )

    return(x)
end
