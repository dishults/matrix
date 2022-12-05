import Utils

public struct Matrix: V, Equatable, CustomStringConvertible {
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

  public var shape: (rows: Int, columns: Int) {
    matrix.isEmpty ? (0, 0) : (count, matrix[0].count)
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

  public func lerp(_ v: V, _ t: Float32) throws -> V {
    guard let other = v as? Matrix else {
      throw GenericError.typesMismatch
    }
    guard shape == other.shape else {
      throw MatrixError.shapesMismatch
    }
    var finalMatrix = [[K]]()
    for row in 0..<count {
      var vector = [K]()
      for column in 0..<count {
        let k = try self[row][column].lerp(other[row][column], t)
        vector.append(k as! K)
      }
      finalMatrix.append(vector)
    }
    return try Matrix(finalMatrix)
  }

  public func mul_vec(_ vec: Vector) throws -> Vector {
    let (rows, columns) = shape
    guard rows == vec.count else {
      throw MatrixError.shapesMismatch
    }
    var finalVector = [K]()
    for column in 0..<columns {
      var k: K = 0
      for row in 0..<rows {
        k.addProduct(self[row][column], vec[row])
      }
      finalVector.append(k)
    }
    return Vector(finalVector)
  }

  public func mul_mat(_ mat: Matrix) throws -> Matrix {
    let (rows, columns) = shape
    guard mat.shape == (columns, rows) else {
      throw MatrixError.shapesMismatch
    }
    var finalMatrix = [[K]]()
    for row in 0..<rows {
      var vector = [K]()
      for columnMat in 0..<rows {
        var k: K = 0
        for column in 0..<columns {
          let rowMat = column
          k.addProduct(self[row][column], mat[rowMat][columnMat])
        }
        vector.append(k)
      }
      finalMatrix.append(vector)
    }
    return try Matrix(finalMatrix)
  }

  public func trace() throws -> K {
    let (rows, columns) = shape
    guard rows == columns else {
      throw MatrixError.notSquare
    }
    var k: K = 0
    for i in 0..<rows {
      k += self[i][i]
    }
    return k
  }

  public func transpose() throws -> Matrix {
    let (rows, columns) = shape
    var transposedMatrix = [[K]]()
    for column in 0..<columns {
      var vector = [K]()
      for row in 0..<rows {
        vector.append(matrix[row][column])
      }
      transposedMatrix.append(vector)
    }
    return try Matrix(transposedMatrix)
  }

  public func row_echelon() throws -> Matrix {
    var M = matrix
    var column = 0
    let (rows, columns) = shape
    for row in 0..<rows {
      if column >= columns {
        return self
      }
      var r = row
      while M[r][column] == 0 {
        r += 1
        if r == rows {
          r = row
          column += 1
          if column == columns {
            return try Matrix(M)
          }
        }
      }

      // Swap
      if r != row {
        M.swapAt(r, row)
      }

      // Divide
      let pivot = M[row][column]
      for c in 0..<columns {
        M[row][c] /= pivot
      }

      // Subtract
      for j in 0..<rows {
        if j != row {
          let num = M[j][column]
          for c in 0..<columns {
            M[j][c] -= num * M[r][c]
          }
        }
      }
      column += 1
    }
    return try Matrix(M)
  }

}
