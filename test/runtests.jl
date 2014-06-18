
tests = ["categorical", 
		 "binomial", 
		 "poisson", 
		 "exponential", 
		 "gamma"]

println("Run tests for Sampling:")

for t in tests
    tfile = string(t, ".jl")
    println(" * $(tfile) ...")
    include(tfile)
end

