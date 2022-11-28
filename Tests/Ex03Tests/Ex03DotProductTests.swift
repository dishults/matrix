import Models
import XCTest

final class DotProductTests: XCTestCase {

  let correctCases: [([K], [K], K)] = [
    // From the subject
    ([0, 0], [1, 1], 0),
    ([1, 1], [1, 1], 2),
    ([-1, 6], [3, 2], 9),
    // Extras
    ([-1, 6, 4], [3, 2, 5], 29),
  ]

  func testCorrectCases() throws {
    for (u, v, expected) in self.correctCases {
      let result = try Vector(u).dot(Vector(v))
      XCTAssertEqual(result, expected)
    }
  }

  let incorrectCases: [([K], [K])] = [
    ([1], [1, 2]),
    ([1, 2], [1]),
  ]

  func testErrors() throws {
    for (u, v) in self.incorrectCases {
      XCTAssertThrowsError(try Vector(u).dot(Vector(v)))
    }
  }

}
