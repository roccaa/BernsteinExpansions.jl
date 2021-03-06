using BernsteinExpansions, Compat, BenchmarkTools

SUITE = BenchmarkGroup()  # parent BenchmarkGroup to contain our suite

SUITE["Univariate"] = SUni = BenchmarkGroup()
SUni["Univariate monomial, floating point input, degree 3"] = @benchmarkable univariate(3, 3, 1.0, 2.0)
SUni["Univariate monomial, floating point input, degree 5"] = @benchmarkable univariate(1, 5, 0.0, 1.0)

SUITE["Multivariate"] = SMulti = BenchmarkGroup()
k = [1,2,3,4,5,2,3,4]
l = [5,5,5,5,5,5,5,5]

low = [1//1,1//1,1//1,1//1,1//1,1//1,1//1,1//1]
high = [2//1,2//1,2//1,2//1,2//1,2//1,2//1,2//1]
SMulti["Rational multivariate expansion"] = @benchmarkable multivariate($k, $l, $low, $high)

low = convert(Vector{Float64}, low)
high = convert(Vector{Float64}, high)
SMulti["Float64 multivariate expansion"] = @benchmarkable multivariate($k, $l, $low, $high)
