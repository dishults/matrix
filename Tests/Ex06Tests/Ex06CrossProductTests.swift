import Models
import XCTest

import func Functions.cross_product

final class CrossProductTests: XCTestCase {

  let correctCases: [([K], [K], [K])] = [
    // From the subject
    ([0, 0, 1], [1, 0, 0], [0, 1, 0]),
    ([1, 2, 3], [4, 5, 6], [-3, 6, -3]),
    ([4, 2, -3], [-2, -5, 16], [17, -58, -16]),
  ]

  func testCorrectCases() throws {
    for (u, v, expected) in self.correctCases {
      var u = Vector(u)
      var v = Vector(v)
      let result = try cross_product(&u, &v)
      XCTAssertEqual(result, Vector(expected))
    }
  }

  let incorrectCases: [([K], [K])] = [
    ([1, 2, 3], [1, 2]),
    ([1, 2], [1, 2, 3]),
    ([1, 2], [3, 4]),
    ([1, 2, 3, 4], [5, 6, 7, 8]),
  ]

  func testErrors() throws {
    for (u, v) in self.incorrectCases {
      var u = Vector(u)
      var v = Vector(v)
      XCTAssertThrowsError(try cross_product(&u, &v))
    }
  }

}
