module Sampling
    using ArrayViews

    import Base: getindex, length, show, rand, rand!

    export 

    # samplebase
    VariateForm, Univariate, Multivariate, Matrixvariate,
    ValueSupport, Discrete, Continuous,
    Sampleable,

    # randi
    RandIntSampler, randi,

    # categorical
    AliasTable, numcategories,

    # binomial
    BinomialGeomSampler, BinomialTPESampler, BinomialPolySampler,
    BinomialAliasSampler,

    # poisson
    PoissonCountSampler, PoissonADSampler,

    # exponential
    ExponentialSampler, randexp,

    # gamma
    GammaMTSampler

    # source files
    include("samplebase.jl")
    include("randi.jl")
    include("categorical.jl")
    include("binomial.jl")
    include("exponential.jl")
    include("gamma.jl")
    include("poisson.jl")

end # module
