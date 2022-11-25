import Utils

public struct Vector: Equatable, CustomStringConvertible {
  public var vector: [K]

  public init(_ vector: [K]) {
    self.vector = vector
  }

  public subscript(index: Int) -> K {
    get {
      return vector[index]
    }
    set(newValue) {
      vector[index] = newValue
    }
  }

  public static func == (v1: Vector, v2: Vector) -> Bool {
    v1.vector == v2.vector
  }

  public var shape: [Int] {
    vector.isEmpty ? [0, 0] : [1, vector.count]
  }

  public var description: String {
    var result = [String]()
    for n in vector {
      result.append("\(n)")
    }
    return result.joined(separator: "\n")
  }

  public mutating func add(_ v: inout Vector) throws {
    guard shape == v.shape else {
      throw MatrixError.shapesMismatch
    }
    for column in 0..<vector.count {
      self[column] += v[column]
    }
  }

  public mutating func sub(_ v: inout Vector) throws {
    guard shape == v.shape else {
      throw MatrixError.shapesMismatch
    }
    for column in 0..<vector.count {
      self[column] -= v[column]
    }
  }

  public mutating func scl(_ a: K) {
    for column in 0..<vector.count {
      self[column] *= a
    }

  }

}
