import Utils

public struct Matrix: Equatable, CustomStringConvertible {
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

  // MARK: - Utilities
  public subscript(index: Int) -> [K] {
    get {
      return matrix[index]
    }
    set(newValue) {
      matrix[index] = newValue
    }
  }

  public var count: Int {
    matrix.count
  }

  public var shape: [Int] {
    matrix.isEmpty ? [0, 0] : [count, matrix[0].count]
  }

  public var isSquare: Bool {
    matrix.isEmpty ? true : count == matrix[0].count
  }

  public var description: String {
    var result = [String]()
    for vector in matrix {
      result.append("\(vector)")
    }
    return result.joined(separator: "\n")
  }

  public static func == (m1: Matrix, m2: Matrix) -> Bool {
    m1.matrix == m2.matrix
  }

  // MARK: - Math
  public mutating func add(_ v: inout Matrix) throws {
    guard shape == v.shape else {
      throw MatrixError.shapesMismatch
    }
    for row in 0..<count {
      for column in 0..<matrix[row].count {
        self[row][column] += v[row][column]
      }
    }
  }

  public mutating func sub(_ v: inout Matrix) throws {
    guard shape == v.shape else {
      throw MatrixError.shapesMismatch
    }
    for row in 0..<count {
      for column in 0..<matrix[row].count {
        self[row][column] -= v[row][column]
      }
    }
  }

  public mutating func scl(_ a: K) {
    for row in 0..<count {
      for column in 0..<matrix[row].count {
        self[row][column] *= a
      }
    }
  }

}
