public class Vector: CustomStringConvertible {
  var vector: [K]

  public init(_ vector: [K]) {
    self.vector = vector
  }

  public var shape: [Int] {
    [1, vector.count]
  }

  public var description: String {
    "\(vector)"
  }

  public func add(_ v: inout Vector) {}
  public func sub(_ v: inout Vector) {}
  public func scl(_ a: K) {}

}
