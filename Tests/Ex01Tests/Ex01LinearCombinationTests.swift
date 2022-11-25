import Models
import XCTest

import func Functions.linear_combination

final class LinearCombinationTests: XCTestCase {

  let correctCases: [([[K]], [K], [K])] = [  // u, coefs, expected
    // From the subject
    ([[1, 0, 0], [0, 1, 0], [0, 0, 1]], [10, 0, 0.5], [10, 0, 0.5]),
    ([[1, 2, 3], [0, 10, -100]], [10, -2], [10, 0, 230]),
    // Extras
    ([], [], []),
    ([[1]], [2], [2]),
    ([[1], [2]], [2, 4], [10]),
  ]

  func testCorrectCases() throws {
    for (u, coefs, expected) in self.correctCases {
      var u = u.map { Vector($0) }
      var coefs = coefs
      let result = try linear_combination(&u, &coefs)
      XCTAssertEqual(result, Vector(expected))
    }
  }

  let incorrectCases: [([[K]], [K])] = [  // u, coefs
    ([[1], [2, 3]], [4, 5, 6]),
    ([[1, 2], [2, 3]], [4, 5, 6]),
    ([[1, 2], [2, 3]], [4]),
    ([[1, 2], [2, 3, 4]], [4, 8]),
    ([[1, 2, 3], [2, 3]], [4, 8]),
  ]

  func testErrors() throws {
    for (u, coefs) in self.incorrectCases {
      var u = u.map { Vector($0) }
      var coefs = coefs
      XCTAssertThrowsError(try linear_combination(&u, &coefs))
    }
  }

}
