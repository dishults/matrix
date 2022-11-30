import Models
import Utils

public func cross_product(_ u: inout Vector, _ v: inout Vector) throws -> Vector {
  guard u.shape == v.shape && u.shape == (1, 3) else {
    throw VectorError.not3D
  }
  return Vector([
    u[1] * v[2] - u[2] * v[1],
    u[2] * v[0] - u[0] * v[2],
    u[0] * v[1] - u[1] * v[0],
  ])
}
