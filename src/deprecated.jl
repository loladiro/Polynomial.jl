@deprecate poly(r, var = :x) fromroots(Polynomial, r; var = var)
@deprecate polyval(p::AbstractPolynomial, x::Number) p(x)
@deprecate polyval(p::AbstractPolynomial, x) p.(x)

function Base.getproperty(p::AbstractPolynomial, nm::Symbol)
    if nm == :a
        Base.depwarn("AbstracPolynomial.a is deprecated, use AbstracPolynomial.coeffs instead.", Symbol("Base.getproperty"))
        return getfield(p, :coeffs)
    end
    return getfield(p, nm)
end

@deprecate polyint(p::AbstractPolynomial, k = 0) integral(p, k)
@deprecate polyint(p::AbstractPolynomial, a, b) integrate(p, a, b)
@deprecate polyder(p::AbstractPolynomial, ord = 1) derivative(p, ord)
@deprecate polyfit(x, y, n = length(x) - 1) fit(Polynomial, x, y; deg = n)
@deprecate polyfit(x, y, sym::Symbol) fit(Polynomial, x, y; var = sym)

@deprecate padeval(PQ::Pade, x::Number) PQ(x)
@deprecate padeval(PQ::Pade, x) PQ.(x)