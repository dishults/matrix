public class Matrix: CustomStringConvertible {
  var matrix: [[K]]

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

  public func add(_ v: inout Matrix) {}
  public func sub(_ v: inout Matrix) {}
  public func scl(_ a: K) {}

}
