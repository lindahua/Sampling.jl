module Sampling

    import Base: getindex, length, show, rand, rand!

    export 

    # samplebase
    VariateForm, Univariate, Multivariate, Matrixvariate,
    ValueSupport, Discrete, Continuous,

    Sampler, 
    UnivariateSampler, DiscreteUnivariateSampler, ContinuousUnivariateSampler,
    MultivariateSampler, DiscreteMultivariateSampler, ContinuousMultivariateSampler,
    MatrixSampler, DiscreteMatrixSampler, ContinuousMatrixSampler,

    # randi
    RandIntSampler, randi,

    # categorical
    AliasTable, numcategories,

    # binomial
    BinomialGeomSampler, BinomialTPESampler, BinomialPolySampler,
    BinomialAliasSampler,

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

end # module
