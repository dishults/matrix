import Models
import XCTest

import func Functions.lerp

final class LinearInterpolationTests: XCTestCase {

  let KCases: [(K, K, Float32, K)] = [  // u, v, t, expected
    // From the subject
    (0, 1, 0, 0),
    (0, 1, 1, 1),
    (0, 1, 0.5, 0.5),
    (21, 42, 0.3, 27.3),
  ]

  func testKCases() throws {
    for (u, v, t, expected) in self.KCases {
      let result = try lerp(u, v, t)
      XCTAssertEqual(result as! K, expected)
    }
  }

  let vectorCases: [([K], [K], Float32, [K])] = [  // u, v, t, expected
    // From the subject
    ([2, 1], [4, 2], 0.3, [2.6, 1.3])
  ]

  func testVectorCases() throws {
    for (u, v, t, expected) in self.vectorCases {
      let result = try lerp(Vector(u), Vector(v), t)
      XCTAssertEqual(result as! Vector, Vector(expected))
    }
  }

  let matrixCases: [([[K]], [[K]], Float32, [[K]])] = [  // u, v, t, expected
    // From the subject
    ([[2, 1], [3, 4]], [[20, 10], [30, 40]], 0.5, [[11, 5.5], [16.5, 22]])
  ]

  func testMatrixCases() throws {
    for (u, v, t, expected) in self.matrixCases {
      let result = try lerp(Matrix(u), Matrix(v), t)
      XCTAssertEqual(result as! Matrix, try Matrix(expected))
    }
  }

  let incorrectCases: [(V, V, Float32)] = [  // u, v, t
    (0 as K, 1 as K, -0.5),
    (0 as K, 1 as K, 1.5),
    (0 as K, Vector([1]), 1),
    (Vector([1]), 0 as K, 1),
  ]

  func testErrors() throws {
    for (u, v, t) in self.incorrectCases {
      XCTAssertThrowsError(try lerp(u, v, t))
    }
    XCTAssertThrowsError(try lerp(Matrix([[1], [2]]), Vector([1]), 1 as K))
    XCTAssertThrowsError(try lerp(Vector([1]), Matrix([[1], [2]]), 1 as K))
  }

}
