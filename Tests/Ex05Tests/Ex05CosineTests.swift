import Models
import XCTest

import func Functions.angle_cos

final class CosineTests: XCTestCase {

  let correctCases: [([K], [K], Float32)] = [
    // From the subject
    ([1, 0], [1, 0], 1),
    ([1, 0], [0, 1], 0),
    ([-1, 1], [1, -1], -1),
    ([2, 1], [4, 2], 1),
    ([1, 2, 3], [4, 5, 6], 0.97463185),
  ]

  func testCorrectCases() throws {
    for (u, v, expected) in self.correctCases {
      var u = Vector(u)
      var v = Vector(v)
      let result = try angle_cos(&u, &v)
      XCTAssertEqual(result, expected)
    }
  }

  let incorrectCases: [([K], [K])] = [
    ([], []),
    ([0], [1]),
    ([1], [0]),
    ([1], [2, 3]),
    ([1, 2], [3]),
  ]

  func testErrors() throws {
    for (u, v) in self.incorrectCases {
      var u = Vector(u)
      var v = Vector(v)
      XCTAssertThrowsError(try angle_cos(&u, &v))
    }
  }

}
