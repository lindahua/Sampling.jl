
randexp() = Base.Random.randmtzig_exprnd()

immutable ExponentialSampler
	scale::Float64
end

rand(s::ExponentialSampler) = s.scale * randexp()

