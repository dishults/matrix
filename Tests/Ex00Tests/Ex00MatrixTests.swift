import Models
import XCTest

final class MatrixTests: XCTestCase {

  let additionCases: [([[K]], [[K]], [[K]])] = [
    // From the subject
    (
      [[1, 2], [3, 4]],
      [[7, 4], [-2, 2]],
      [[8, 6], [1, 6]]
    )
  ]

  func testAddition() throws {
    for (m1, m2, expected) in self.additionCases {
      var u = try Matrix(m1)
      var v = try Matrix(m2)
      try u.add(&v)
      XCTAssertEqual(u.matrix, expected)
    }
  }

  let subtractionCases: [([[K]], [[K]], [[K]])] = [
    // From the subject
    (
      [[1, 2], [3, 4]],
      [[7, 4], [-2, 2]],
      [[-6, -2], [5, 2]]
    )
  ]

  func testSubtraction() throws {
    for (m1, m2, expected) in self.subtractionCases {
      var u = try Matrix(m1)
      var v = try Matrix(m2)
      try u.sub(&v)
      XCTAssertEqual(u.matrix, expected)
    }
  }

  let scalingCases: [([[K]], K, [[K]])] = [
    // From the subject
    (
      [[1, 2], [3, 4]],
      2,
      [[2, 4], [6, 8]]
    )
  ]

  func testScaling() throws {
    for (m1, k, expected) in self.scalingCases {
      var u = try Matrix(m1)
      u.scl(k)
      XCTAssertEqual(u.matrix, expected)
    }
  }

  let incorrectCases: [([[K]], [[K]])] = [
    (
      [[1], [3]],
      [[1, 2], [3, 4]]
    ),
    (
      [[1, 2], [3, 4]],
      [[1], [3]]
    ),
  ]

  func testErrors() throws {
    for (m1, m2) in self.incorrectCases {
      var u = try Matrix(m1)
      var v = try Matrix(m2)
      XCTAssertThrowsError(try u.add(&v))
      XCTAssertThrowsError(try u.sub(&v))
    }
  }

  let incorrectShapes: [[[K]]] = [
    [[]], // just [] is OK
    [[1], [3, 4]],
    [[1, 2], [3]],
  ]

  func testShapeErrors() throws {
    for m1 in self.incorrectShapes {
      XCTAssertThrowsError([try Matrix(m1)])
    }
  }

}
