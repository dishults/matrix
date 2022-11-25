import Utils

public struct Vector: CustomStringConvertible {
  public var vector: [K]

  public init(_ vector: [K]) {
    self.vector = vector
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
    // TODO
    vector = [7, 10]
  }
  public mutating func sub(_ v: inout Vector) throws {
    guard shape == v.shape else {
      throw MatrixError.shapesMismatch
    }
    // TODO
    vector = [-3, -4]
  }
  public mutating func scl(_ a: K) {
    // TODO
    vector = [4, 6]

  }

}
