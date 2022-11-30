import Models
import XCTest

final class MatrixByMatrixMultiplicationTests: XCTestCase {

  let correctCases: [([[K]], [[K]], [[K]])] = [
    // From the subject
    ([[1, 0], [0, 1]], [[1, 0], [0, 1]], [[1, 0], [0, 1]]),
    ([[1, 0], [0, 1]], [[2, 1], [4, 2]], [[2, 1], [4, 2]]),
    ([[3, -5], [6, 8]], [[2, 1], [4, 2]], [[-14, -7], [44, 22]]),
    // Extras
    ([[1, 2, 3], [4, 5, 6]], [[7, 8], [9, 10], [11, 12]], [[58, 64], [139, 154]]),
  ]

  func testCorrectCases() throws {
    for (u, v, expected) in self.correctCases {
      let res = try Matrix(u).mul_mat(Matrix(v))
      XCTAssertEqual(res.matrix, expected)
    }
  }

  let incorrectCases: [([[K]], [[K]])] = [
    ([[1, 0], [0, 1]], [[1, 0, 2], [0, 1, 2]]),
    ([[1, 0], [0, 1]], [[1], [2]]),
  ]

  func testErrors() throws {
    for (u, v) in self.incorrectCases {
      XCTAssertThrowsError(try Matrix(u).mul_mat(Matrix(v)))
    }
  }

}
