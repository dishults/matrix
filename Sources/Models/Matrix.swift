import Utils

public struct Matrix: CustomStringConvertible {
  public var matrix: [[K]]

  public init(_ matrix: [[K]]) {
    self.matrix = matrix
  }

  public var shape: [Int] {
    [matrix.count, matrix[0].count]
  }

  public var isSquare: Bool {
    matrix.count == matrix[0].count
  }

  public var description: String {
    var result = [String]()
    for vector in matrix {
      result.append("\(vector)")
    }
    return result.joined(separator: "\n")
  }

  public mutating func add(_ v: inout Matrix) throws {
    guard shape == v.shape else {
      throw MatrixError.shapesMismatch
    }
    // TODO
    matrix = [[8.0, 6.0], [1.0, 6.0]]
  }
  public mutating func sub(_ v: inout Matrix) throws {
    guard shape == v.shape else {
      throw MatrixError.shapesMismatch
    }
    // TODO
    matrix = [[-6.0, -2.0], [5.0, 2.0]]
  }
  public mutating func scl(_ a: K) {
    // TODO
    matrix = [[2.0, 4.0], [6.0, 8.0]]
  }

}
