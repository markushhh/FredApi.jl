function load_api_key()
    ENV["API_FRED"] = read(joinpath(homedir(), ".fred_api_key"), String)
    return nothing
end
