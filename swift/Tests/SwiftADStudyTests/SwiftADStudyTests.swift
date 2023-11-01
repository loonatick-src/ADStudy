import XCTest
import _Differentiation
import RealModule
@testable import SwiftADStudy


    // TODO: refactor tests for better failure reporting. Consult https://developer.apple.com/documentation/xctest
final class SwiftADStudyTests: XCTestCase {
    func testNumToNumFunctions() throws {
        let abstol: Float = 1.0e-4
        let testFunctions: [@differentiable(reverse) (Float)->Float] = [numToNum_1, numToNum_2, numToNum_3]
        let testDerivatives: [(Float)->Float] = [d_numToNum_1, d_numToNum_2, d_numToNum_3]
        let testCaseInputs: [Float] = [1, 1.5, 2, Float.pi, 11.32]
        for (f, df) in zip(testFunctions, testDerivatives) {
            for input in testCaseInputs {
                XCTAssertEqual(derivative(at: input, of: f), df(input), accuracy: abstol)
            }
        }
        // XCTAssertEqual(sin(Float.pi), Float.sin(Float.pi), accuracy: abstol)
    }
}
