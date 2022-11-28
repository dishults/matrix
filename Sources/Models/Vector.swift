import Utils

public struct Vector: V, Equatable, CustomStringConvertible {
  public var vector: [K]

  public init(_ vector: [K]) {
    self.vector = vector
  }

  // MARK: - Utilities
  public subscript(index: Int) -> K {
    get {
      return vector[index]
    }
    set(newValue) {
      vector[index] = newValue
    }
  }

  public var count: Int {
    vector.count
  }

  public var shape: [Int] {
    vector.isEmpty ? [0, 0] : [1, count]
  }

  public var description: String {
    var result = [String]()
    for n in vector {
      result.append("\([n])")
    }
    return result.joined(separator: "\n")
  }

  public static func == (v1: Vector, v2: Vector) -> Bool {
    v1.vector == v2.vector
  }

  // MARK: - Math
  public mutating func add(_ v: inout Vector) throws {
    guard shape == v.shape else {
      throw MatrixError.shapesMismatch
    }
    for column in 0..<count {
      self[column] += v[column]
    }
  }

  public mutating func sub(_ v: inout Vector) throws {
    guard shape == v.shape else {
      throw MatrixError.shapesMismatch
    }
    for column in 0..<count {
      self[column] -= v[column]
    }
  }

  public mutating func scl(_ a: K) {
    for column in 0..<count {
      self[column] *= a
    }
  }

  public func lerp(_ v: V, _ t: Float32) throws -> V {
    guard let other = v as? Vector else {
      throw GenericError.typesMismatch
    }
    guard shape == other.shape else {
      throw MatrixError.shapesMismatch
    }
    var finalVector = [K]()
    for column in 0..<count {
      let k = try self[column].lerp(other[column], t)
      finalVector.append(k as! K)
    }
    return Vector(finalVector)
  }

  public func dot(_ v: Vector) throws -> K {
    guard shape == v.shape else {
      throw MatrixError.shapesMismatch
    }
    var dot: K = 0
    for i in 0..<count {
      dot.addProduct(self[i], v[i])
    }
    return dot
  }

}
