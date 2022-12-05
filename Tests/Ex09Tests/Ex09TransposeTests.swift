import Models
import XCTest

final class TransposeTests: XCTestCase {

  let correctCases: [([[K]], [[K]])] = [
    ([[1], [2]], [[1, 2]]),
    ([[1, 2], [3, 4]], [[1, 3], [2, 4]]),
  ]

  func testCorrectCases() throws {
    for (u, v) in self.correctCases {
      let u = try Matrix(u)
      let v = try Matrix(v)
      XCTAssertEqual(try u.transpose(), v)
      XCTAssertEqual(try v.transpose(), u)
    }
  }

}
