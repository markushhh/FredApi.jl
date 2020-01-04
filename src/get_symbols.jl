
function get_symbols(symbol::String, f, t)

    x = get_symbols(symbol::String)

    x = from(x, Date(f))
    x = to(x, Date(t))

    return(x)
end

function get_symbols(symbol::String)

    parameters = Dict("api_key" => "8acd2cd4e9a52d3c9984b69deed24617",
                    "file_type" => "json",
                    "series_id" => symbol)

    response = HTTP.request("GET", "https://api.stlouisfed.org/fred/series/observations", []; query = parameters)
    observations = JSON.parse(String(response.body))["observations"]

    x = DataFrame(
        Value = [parse(Float64, observations[i]["value"]) for i ∈ eachindex(observations)],
        Time = Dates.Date.([observations[i]["date"] for i ∈ eachindex(observations)])
    )

    x = TimeArray(x, timestamp = :Time)
    return(x)
end
