function set_api_key(api_key)

    if "API_FRED" in keys(ENV)
        if length(ENV["API_FRED"]) == 0
            ENV["API_FRED"] = api_key
            println("Your API key is: " * ENV["API_FRED"])
        end
    else
        ENV["API_FRED"] = api_key
        println("local API key is set.")
    end

    return nothing
end
