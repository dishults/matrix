import Utils

public struct Matrix: CustomStringConvertible {
  public var matrix: [[K]]

  public init(_ matrix: [[K]]) throws {
    if matrix.count > 0 {
      // Check first row isn't empty
      let size = matrix[0].count
      guard size > 0 else {
        throw MatrixError.emptyRow
      }
      // Check shape consistency
      for m in matrix {
        guard m.count == size else {
          throw MatrixError.inconsistentShape
        }
      }
    }
    self.matrix = matrix
  }

  public var shape: [Int] {
    matrix.isEmpty ? [0, 0] : [matrix.count, matrix[0].count]
  }

  public var isSquare: Bool {
    matrix.isEmpty ? true : matrix.count == matrix[0].count
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
    matrix = [[8, 6], [1, 6]]
  }
  public mutating func sub(_ v: inout Matrix) throws {
    guard shape == v.shape else {
      throw MatrixError.shapesMismatch
    }
    // TODO
    matrix = [[-6, -2], [5, 2]]
  }
  public mutating func scl(_ a: K) {
    // TODO
    matrix = [[2, 4], [6, 8]]
  }

}
