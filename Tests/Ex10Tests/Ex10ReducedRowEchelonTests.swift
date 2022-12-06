import Models
import XCTest

final class ReducedRowEchelonTests: XCTestCase {

  let correctCases: [([[K]], [[K]])] = [
    // From the subject
    (
      [
        [1, 0, 0],
        [0, 1, 0],
        [0, 0, 1],
      ],
      [
        [1, 0, 0],
        [0, 1, 0],
        [0, 0, 1],
      ]
    ),
    (
      [
        [1, 2],
        [3, 4],
      ],
      [
        [1, 0],
        [0, 1],
      ]
    ),
    (
      [
        [1, 2],
        [2, 4],
      ],
      [
        [1, 2],
        [0, 0],
      ]
    ),
    (
      [
        [8, 5, -2, 4, 28],
        [4, 2.5, 20, 4, -4],
        [8, 5, 1, 4, 17],
      ],
      [
        [1, 0.625, 0, 0, -12.166668],
        [0, 0, 1, 0, -3.6666667],
        [0, 0, 0, 1, 29.5],
      ]
    ),
    // Extras
    (
      [  // Example from Wikipedia's Row echelon form page
        [1, 3, -1],
        [0, 1, 7],
      ],
      [
        [1, 0, -22],
        [0, 1, 7],
      ]
    ),
    (
      [  // Example from Wikipedia's Gaussian elimination page
        [1, 3, 1, 9],
        [1, 1, -1, 1],
        [3, 11, 5, 35],
      ],
      [
        [1, 0, -2, -3],
        [0, 1, 1, 4],
        [0, 0, 0, 0],
      ]
    ),
    (
      [  // Example that uses swap rows
        [0, 1, 0],
        [1, 0, 0],
        [0, 0, 1],
      ],
      [
        [1, 0, 0],
        [0, 1, 0],
        [0, 0, 1],
      ]
    ),
    (
      [  // Example that returns in 'if column >= columns'
        [0, 1],
        [1, 2],
        [2, 3],
      ],
      [
        [1, 0],
        [0, 1],
        [0, 0],
      ]
    ),
  ]

  func testCorrectCases() throws {
    for (u, expected) in self.correctCases {
      XCTAssertEqual(try Matrix(u).row_echelon(), try Matrix(expected))
    }
  }

}
