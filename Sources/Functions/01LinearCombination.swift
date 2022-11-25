import Models
import Utils

public func linear_combination(_ u: inout [Vector], _ coefs: inout [K]) throws -> Vector {
  // Checks
  guard u.count == coefs.count else {
    throw MatrixError.shapesMismatch
  }
  if u.count == 0 {
    return Vector([])
  }

  // Linear combination
  var finalVector = Vector(Array(repeating: 0, count: u[0].vector.count))
  for i in 0..<u.count {
    var vector = u[i]
    vector.scl(coefs[i])
    try finalVector.add(&vector)
  }
  return finalVector
}
