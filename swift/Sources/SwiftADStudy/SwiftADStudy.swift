// The Swift Programming Language
// https://docs.swift.org/swift-book

// import Numerics
import Foundation
import _Differentiation

// @derivative(of: sin)
// public func dsin(_ x: Float) -> (value: Float,
//                                  differential: (Float) -> Float) {
//     let c = cos(x)
//     return (
//         value: c,
//         differential: { v in v * c }
//     )
// }

// @derivative(of: cos)
// @usableFromInline
// func dcos(_ x: Float) -> (value: Float,
//                           differential: (Float) -> Float) {
//     let s = -sin(x)
//     return (
//         value: s,
//         differential: { $0 * s }
//     )
// }

// @derivative(of: tan)
// @usableFromInline
// func dtan(_ x: Float) -> (value: Float, differential: (Float) -> Float) {
//     let secx = 1/cos(x)
//     let s = secx * secx
//     return (
//         value: s,
//         differential: { $0 * s }
//     )
// }

@differentiable(reverse)
func numToNum_1(_ x: Float) -> Float {
    let sinsq_x = sin(x) * sin(x)
    let cossq_x = cos(x) * cos(x)
    return sinsq_x / cossq_x
}

func d_numToNum_1(_ x: Float) -> Float {
    let sinsq_x = sin(x) * sin(x)
    let cossq_x = cos(x) * cos(x)
    let cos4_x = cossq_x * cossq_x
    return 2*tan(x) + sin(2*x)*sinsq_x / (cos4_x)
}

@differentiable(reverse)
func numToNum_2(_ x: Float) -> Float {
    return 2*x + sqrt(x*x*x)
}

func d_numToNum_2(_ x: Float) -> Float {
    return 2 + 1.5 * sqrt(x) 
}

@differentiable(reverse)
func numToNum_3(_ x: Float) -> Float {
    return pow(10.31, 2*x) - x
}

@differentiable(reverse)
func d_numToNum_3(_ x: Float) -> Float {
    return 2 * pow(10.31, 2*x) * log(10.31) - 1
} 