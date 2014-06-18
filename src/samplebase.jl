
abstract ValueSupport
type Discrete   <: ValueSupport end
type Continuous <: ValueSupport end

default_eltype(::Type{Discrete}) = Int
default_eltype(::Type{Continuous}) = Float64

abstract VariateForm
type Univariate    <: VariateForm end
type Multivariate  <: VariateForm end
type Matrixvariate <: VariateForm end

abstract Sampleable{F<:VariateForm,S<:ValueSupport}

## generic batch rand methods

function rand!(s::Sampleable{Univariate}, A::AbstractArray)
    for i in 1:length(A)
        @inbounds A[i] = rand(s)
    end
    return A
end

rand{S<:ValueSupport}(s::Sampleable{Univariate,S}, shp::Union(Int,(Int...))) = 
	rand!(s, Array(default_eltype(S), shp))

function rand!(s::Sampleable{Multivariate}, A::DenseMatrix)
	for i = 1:size(A,2)
		rand!(s, view(A,:,i))
	end
	return A
end

rand{S<:ValueSupport}(s::Sampleable{Multivariate,S}) = 
	rand!(s, Array(default_eltype(S), dim(s)))

rand{S<:ValueSupport}(s::Sampleable{Multivariate,S}, n::Int) = 
	rand!(s, Array(default_eltype(S), dim(s), n))

