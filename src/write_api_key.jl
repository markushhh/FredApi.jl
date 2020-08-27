function write_api_key(api_key::String)
    io = open(joinpath(homedir(), ".fred_api_key"), "w")
    println(io, api_key)
    close(io)
    return nothing
end
