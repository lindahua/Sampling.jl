
randexp() = Base.Random.randmtzig_exprnd()

immutable ExponentialSampler <: ContinuousUnivariateSampler
	scale::Float64
end

rand(s::ExponentialSampler) = s.scale * randexp()

