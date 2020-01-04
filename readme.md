# FredApi.jl

!["logo"](docs/src/assets/logo.png)

`FredApi.jl` offers the possibility to access the [FRED Developer API](https://research.stlouisfed.org/docs/api/) in Julia.
This package was inspired by [FredData.jl](https://github.com/micahjsmith/FredData.jl) but is much easier to use and focuses much more on the time series data.

## Installation

```@julia
add FredApi
```

or

```@julia
add https://github.com/markushhh/FredApi.jl/
```

## Tutorial

Download a full dataset with

```@julia
get_symbols("GDPC1")
```

output

```@julia
291×1 TimeArray{Float64,1,Date,Array{Float64,1}} 1947-01-01 to 2019-07-01
│            │ Value     │
├────────────┼───────────┤
│ 1947-01-01 │ 2033.061  │
│ 1947-04-01 │ 2027.639  │
│ 1947-07-01 │ 2023.452  │
│ 1947-10-01 │ 2055.103  │
│ 1948-01-01 │ 2086.017  │
│ 1948-04-01 │ 2120.45   │
│ 1948-07-01 │ 2132.598  │
│ 1948-10-01 │ 2134.981  │
│ 1949-01-01 │ 2105.562  │
   ⋮
│ 2017-10-01 │ 18322.464 │
│ 2018-01-01 │ 18438.254 │
│ 2018-04-01 │ 18598.135 │
│ 2018-07-01 │ 18732.72  │
│ 2018-10-01 │ 18783.548 │
│ 2019-01-01 │ 18927.281 │
│ 2019-04-01 │ 19021.86  │
│ 2019-07-01 │ 19121.112 │
```

Download a subsample

```@julia
get_symbols("GDPC1", "2010-01-01", "2019-01-01")
```

output

```@julia
37×1 TimeArray{Float64,1,Date,Array{Float64,1}} 2010-01-01 to 2019-01-01
│            │ Value     │
├────────────┼───────────┤
│ 2010-01-01 │ 15415.145 │
│ 2010-04-01 │ 15557.277 │
│ 2010-07-01 │ 15671.967 │
│ 2010-10-01 │ 15750.625 │
│ 2011-01-01 │ 15712.754 │
│ 2011-04-01 │ 15825.096 │
│ 2011-07-01 │ 15820.7   │
│ 2011-10-01 │ 16004.107 │
│ 2012-01-01 │ 16129.418 │
   ⋮
│ 2017-04-01 │ 18021.048 │
│ 2017-07-01 │ 18163.558 │
│ 2017-10-01 │ 18322.464 │
│ 2018-01-01 │ 18438.254 │
│ 2018-04-01 │ 18598.135 │
│ 2018-07-01 │ 18732.72  │
│ 2018-10-01 │ 18783.548 │
│ 2019-01-01 │ 18927.281 │
```

To change the time frame of the dataset, the `collapse()` function in `TimeSeries.jl` comes in really handy.

```@julia
using TimeSeries

x = get_symbols("FEDFUNDS", "2000-01-01", "2019-01-01")

collapse(x, year, first)
```

output

```@julia
229×1 TimeArray{Float64,1,Date,Array{Float64,1}} 2000-01-01 to 2019-01-01
│            │ Value │
├────────────┼───────┤
│ 2000-01-01 │ 5.45  │
│ 2000-02-01 │ 5.73  │
│ 2000-03-01 │ 5.85  │
│ 2000-04-01 │ 6.02  │
│ 2000-05-01 │ 6.27  │
│ 2000-06-01 │ 6.53  │
│ 2000-07-01 │ 6.54  │
│ 2000-08-01 │ 6.5   │
│ 2000-09-01 │ 6.52  │
   ⋮
│ 2018-06-01 │ 1.82  │
│ 2018-07-01 │ 1.91  │
│ 2018-08-01 │ 1.91  │
│ 2018-09-01 │ 1.95  │
│ 2018-10-01 │ 2.19  │
│ 2018-11-01 │ 2.2   │
│ 2018-12-01 │ 2.27  │
│ 2019-01-01 │ 2.4   │
```

```@julia
using Plots

plot(x, legend = false)
```

!["plot"](docs/src/assets/plot.png)

To explore more options, go to [TimeSeries.jl](https://github.com/JuliaStats/TimeSeries.jl/blob/master/docs/src/combine.md)

# Each comment, suggestion or pull request is welcome!
