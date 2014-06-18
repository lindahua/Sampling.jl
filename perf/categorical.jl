using Sampling

function bench_categorical_sampler(s, pv::Vector{Float64}, ns::Int)
    # warm up
    for i = 1:10; rand(s); end
    # measure
    et = @elapsed for i = 1:ns; rand(s); end
    mps = (ns * 1.0e-6) / et
    @printf("%-13s with K = %4d =>  %9.4f MPS\n", string(typeof(s)), length(pv), mps)
end

for K in 2.^(1:12)
    pv = fill(1/K, K)
    bench_categorical_sampler(AliasTable(pv), pv, 10^6)
end

