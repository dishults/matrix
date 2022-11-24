import Models
import XCTest

final class MatrixTests: XCTestCase {

  let additionCases: [([[K]], [[K]], [[K]])] = [
    // From the subject
    (
      [[1.0, 2.0], [3.0, 4.0]],
      [[7.0, 4.0], [-2.0, 2.0]],
      [[8.0, 6.0], [1.0, 6.0]]
    )
  ]

  func testAddition() throws {
    for (m1, m2, expected) in self.additionCases {
      var u = Matrix(m1)
      var v = Matrix(m2)
      try u.add(&v)
      XCTAssertEqual(u.matrix, expected)
    }
  }

  let subtractionCases: [([[K]], [[K]], [[K]])] = [
    // From the subject
    (
      [[1.0, 2.0], [3.0, 4.0]],
      [[7.0, 4.0], [-2.0, 2.0]],
      [[-6.0, -2.0], [5.0, 2.0]]
    )
  ]

  func testSubtraction() throws {
    for (m1, m2, expected) in self.subtractionCases {
      var u = Matrix(m1)
      var v = Matrix(m2)
      try u.sub(&v)
      XCTAssertEqual(u.matrix, expected)
    }
  }

  let scalingCases: [([[K]], K, [[K]])] = [
    // From the subject
    (
      [[1.0, 2.0], [3.0, 4.0]],
      2.0,
      [[2.0, 4.0], [6.0, 8.0]]
    )
  ]

  func testScaling() throws {
    for (m1, k, expected) in self.scalingCases {
      var u = Matrix(m1)
      u.scl(k)
      XCTAssertEqual(u.matrix, expected)
    }
  }

  let incorrectCases: [([[K]], [[K]])] = [
    (
      [[1.0, 2.0], [3.0, 4.0]],
      [[1.0, 2.0, 3.0], [3.0, 4.0, 5.0]]
    ),
    (
      [[1.0, 2.0, 3.0], [3.0, 4.0, 5.0]],
      [[1.0, 2.0], [3.0, 4.0]]
    ),
//    (
//      [[1.0, 2.0], [3.0, 4.0, 5.0]],
//      [[1.0, 2.0], [3.0, 4.0]]
//    ),
//    (
//      [[1.0, 2.0, 3.0], [3.0, 4.0]],
//      [[1.0, 2.0], [3.0, 4.0]]
//    ),
//    (
//      [[1.0, 2.0], [3.0, 4.0]],
//      [[1.0, 2.0], [3.0, 4.0, 5.0]]
//    ),
//    (
//      [[1.0, 2.0], [3.0, 4.0]],
//      [[1.0, 2.0, 3.0], [3.0, 4.0]]
//    ),
  ]

  func testErrors() throws {
    for (m1, m2) in self.incorrectCases {
      var u = Matrix(m1)
      var v = Matrix(m2)
      XCTAssertThrowsError(try u.add(&v))
      XCTAssertThrowsError(try u.sub(&v))
    }
  }

}
