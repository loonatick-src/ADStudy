import Numerics
import _Differentiation

// @differentiable(reverse)
// func sin<T: Real & Differentiable>(_ x: T) -> T {
//     return T.sin(x)
// } 

public func sin<T: Real>(_ x: T) -> T {
    return T.sin(x)
}

public func cos<T: Real>(_ x: T) -> T {
    return T.cos(x)
}

@derivative(of: sin)
@usableFromInline
func ndsin<T: Real & Differentiable>(_ x: T) -> (value: T, pullback: (T.TangentVector) -> T.TangentVector) where T.TangentVector == T {
    let value = T.sin(x)
    func pullback(derivativeToOutput: T) -> T.TangentVector {
        let derivativeToInput = T.cos(x) * derivativeToOutput
        return derivativeToInput
    }
    return (value: value, pullback: pullback)
}

@derivative(of: cos)
@usableFromInline
func ndcos<T: Real & Differentiable>(_ x: T) -> (value: T, pullback: (T.TangentVector) -> T.TangentVector) where T.TangentVector == T {
    let value = T.cos(x)
    func pullback(derivativeToOutput: T.TangentVector) -> T.TangentVector {
        let derivativeToInput = -T.sin(x) * derivativeToOutput
        return derivativeToInput
    }
    return (value: value, pullback: pullback)
}