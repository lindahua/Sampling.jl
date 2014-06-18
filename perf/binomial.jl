# benchmark for binomial samplers

using Sampling
import Sampling: BinomialRmathSampler

function bench_binomial_sampler(s, params::(Int, Float64), ns::Int)
    # warm up
    for i = 1:10; rand(s); end
    # measure
    et = @elapsed for i = 1:ns; rand(s); end
    mps = (ns * 1.0e-6) / et
    @printf("%-20s on (%4d, %4.2f)  =>  %9.4f MPS\n", string(typeof(s)), params[1], params[2], mps)
end

for n in 2.^(1:7), p in [0.3, 0.5, 0.9]
    bench_binomial_sampler(BinomialGeomSampler(n, p), (n, p), 10^5)
end
println()

for n in (20 * 2.^(1:8)), p in [0.3, 0.6]
    bench_binomial_sampler(BinomialTPESampler(n, p), (n, p), 10^5)
end
println()

for n in 2.^(1:12), p in [0.3, 0.5, 0.9]
    bench_binomial_sampler(BinomialPolySampler(n, p), (n, p), 10^5)
end
println()

for n in 2.^(1:12), p in [0.3, 0.5, 0.9]
    bench_binomial_sampler(BinomialRmathSampler(n, p), (n, p), 10^5)
end
println()

for n in 2.^(1:12), p in [0.3, 0.5, 0.9]
    bench_binomial_sampler(BinomialAliasSampler(n, p), (n, p), 10^5)
end
println()
