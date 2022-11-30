import Models
import Utils

public func angle_cos(_ u: inout Vector, _ v: inout Vector) throws -> Float32 {
  let cos = try u.dot(v) / u.norm() / v.norm()
  guard !cos.isNaN else {
    throw MatrixError.zeroVector
  }
  return cos
}
