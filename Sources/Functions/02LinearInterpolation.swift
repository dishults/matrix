import Models
import Utils

public func lerp(_ u: V, _ v: V, _ t: Float32) throws -> V {
  guard t >= 0.0 && t <= 1.0 else {
    throw GenericError.incorrectValue(t)
  }
  return try u.lerp(v, t)
}
