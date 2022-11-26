import Models
import Utils

public func linear_combination(_ u: inout [Vector], _ coefs: inout [K]) throws -> Vector {
  // Perform checks
  guard u.count == coefs.count else {
    throw MatrixError.shapesMismatch
  }
  if u.count == 0 {
    return Vector([])
  }

  // Calculate linear combination using allowed fused multiply-add function
  var finalVector = [K]()
  for column in 0..<u[0].count {
    var linearCombination: K = 0
    for row in 0..<u.count {
      guard u[0].vector.count == u[row].vector.count else {
        throw MatrixError.shapesMismatch
      }
      // fma function
      linearCombination.addProduct(u[row][column], coefs[row])
    }
    finalVector.append(linearCombination)
  }
  return Vector(finalVector)
}
