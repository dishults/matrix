import Models
import XCTest

final class NormTests: XCTestCase {

  let correctCases: [([K], Float32, Float32, Float32)] = [
    // From the subject
    ([0, 0, 0], 0, 0, 0),
    ([1, 2, 3], 6, 3.7416575, 3),
    ([-1, -2], 3, 2.236068, 2),
    // Extras
    ([], 0, 0, 0),
  ]

  func testCorrectCases() throws {
    for (u, norm_1, norm, norm_inf) in self.correctCases {
      let u = Vector(u)
      XCTAssertEqual(u.norm_1(), norm_1)
      XCTAssertEqual(u.norm(), norm)
      XCTAssertEqual(u.norm_inf(), norm_inf)
    }
  }

}
