import Models
import XCTest

final class MatrixByVectorMultiplicationTests: XCTestCase {

  let correctCases: [([[K]], [K], [K])] = [
    // From the subject
    ([[1, 0], [0, 1]], [4, 2], [4, 2]),
    ([[2, 0], [0, 2]], [4, 2], [8, 4]),
    ([[2, -2], [-2, 2]], [4, 2], [4, -4]),
    // Extras
    ([[13, 9, 7, 15], [8, 7, 4, 6], [6, 4, 0, 3]], [3, 4, 2], [83, 63, 37, 75]),
  ]

  func testCorrectCases() throws {
    for (u, v, expected) in self.correctCases {
      let res = try Matrix(u).mul_vec(Vector(v))
      XCTAssertEqual(res.vector, expected)
    }
  }

  let incorrectCases: [([[K]], [K])] = [
    ([[1, 0], [0, 1]], [4, 2, 3]),
    ([[1, 0], [0, 1]], [4]),
  ]

  func testErrors() throws {
    for (u, v) in self.incorrectCases {
      XCTAssertThrowsError(try Matrix(u).mul_vec(Vector(v)))
    }
  }

}
