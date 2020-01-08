"""
# Search for the symbol of an economic data series that matches the search text.

    search_variable(search_text, must_contain)

## Arguments

    - `search_title` : A string containing the words with which you expect to find the id of the variable.
    - `must_contain` : A string like "Germany" to explicitly search for a variable which contains "Germany" in its title

## Description

The resulting DataFrame is sorted by popularity.

## Example

```jldoctest
julia> search_variable("Exports", "Mexico")
julia> search_variable("GDP", "Germany")
julia> search_variable("G", "France")
julia> x = search_variable("Exports", "Mexico")
julia> println(x)
```
"""
function search_symbol(search_title::String, must_contain::String = "")

    search_text = replace(search_title, " " => "+")
    url = "https://api.stlouisfed.org/fred/series/search"

    parameters = Dict("api_key" => ENV["API_FRED"],
                      "file_type" => "json",
                      "search_text" => search_text)

    response = HTTP.request("GET", url; query = parameters)
    results = JSON.parse(String(response.body))["seriess"]

    x = DataFrame(
        popularity = zeros(Int, eachindex(results)),
        title = ["" for i ∈ eachindex(results)],
        id = ["" for i ∈ eachindex(results)]
    )

    for i ∈ eachindex(results)
        x[i, 1] = results[i]["popularity"]
        x[i, 2] = results[i]["id"]
        x[i, 3] = results[i]["title"]
    end

    i = findall([occursin(must_contain, x[i, 3]) for i ∈ 1:nrow(x)] .== true)
    x = sort!(x[i, :], rev = true)

    return(x)
end
