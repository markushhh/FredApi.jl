function load_api_key()
    ENV["API_FRED"] = read(joinpath(homedir(), ".freddatarc"), String)
    return nothing
end
