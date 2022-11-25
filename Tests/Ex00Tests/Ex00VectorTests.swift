import Models
import XCTest

final class VectorTests: XCTestCase {

  let additionCases: [([K], [K], [K])] = [
    // From the subject
    ([2, 3], [5, 7], [7, 10])
  ]

  func testAddition() throws {
    for (v1, v2, expected) in self.additionCases {
      var u = Vector(v1)
      var v = Vector(v2)
      try u.add(&v)
      XCTAssertEqual(u.vector, expected)
    }
  }

  let subtractionCases: [([K], [K], [K])] = [
    // From the subject
    ([2, 3], [5, 7], [-3, -4])
  ]

  func testSubtraction() throws {
    for (v1, v2, expected) in self.subtractionCases {
      var u = Vector(v1)
      var v = Vector(v2)
      try u.sub(&v)
      XCTAssertEqual(u.vector, expected)
    }
  }

  let scalingCases: [([K], K, [K])] = [
    // From the subject
    ([2, 3], 2, [4, 6])
  ]

  func testScaling() throws {
    for (v1, k, expected) in self.scalingCases {
      var u = Vector(v1)
      u.scl(k)
      XCTAssertEqual(u.vector, expected)
    }
  }

  let incorrectCases: [([K], [K])] = [
    ([2, 3], [5, 7, 10]),
    ([2, 3, 4], [5, 7]),
  ]

  func testErrors() throws {
    for (v1, v2) in self.incorrectCases {
      var u = Vector(v1)
      var v = Vector(v2)
      XCTAssertThrowsError(try u.add(&v))
      XCTAssertThrowsError(try u.sub(&v))
    }
  }

}
