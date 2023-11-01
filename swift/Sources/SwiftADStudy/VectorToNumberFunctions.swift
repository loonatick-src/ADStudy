import RealModule
import _Differentiation

@differentiable(reverse)
func rosenbrock_1<T: Differentiable & Real>(x: [T]) -> T {
    let a: T = 1.0 as! T
    let b: T = (100.0 as! T) * a
    var result: T  = 0.0 as! T
    for i in 0..<withoutDerivative(at:x.count-1) {
        let xi_sq:T = T.pow(x[i], 2)
        let x1 = a - xi_sq
        let x2 = b * x[i+1]
        let x3 = -xi_sq
        result += x1 + x2 + x3
    }
    return result
}