import Models
import XCTest

final class TraceTests: XCTestCase {

  let correctCases: [([[K]], K)] = [
    // From the subject
    ([[2, -5, 0], [4, 3, 7], [-2, 3, 4]], 9),
    ([[1, 0], [0, 1]], 2),
    ([[-2, -8, 4], [1, -23, 4], [0, 6, 4]], -21),
    // Extras
    ([[1]], 1),
    ([], 0),
  ]

  func testCorrectCases() throws {
    for (u, expected) in self.correctCases {
      XCTAssertEqual(try Matrix(u).trace(), expected)
    }
  }

  let incorrectCases: [([[K]])] = [
    ([[1, 2]]),
    ([[1], [2]]),
    ([[1, 2, 3], [1, 2, 3]]),
  ]

  func testErrors() throws {
    for u in self.incorrectCases {
      XCTAssertThrowsError(try Matrix(u).trace())
    }
  }

}
