import Utils

public typealias K = Float32

public protocol V {
  func lerp(_ v: V, _ t: Float32) throws -> V
}

extension K: V {
  public var abs: K {
    self >= 0 ? self : self * -1
  }

  public func lerp(_ v: V, _ t: Float32) throws -> V {
    guard let k = v as? K else {
      throw GenericError.typesMismatch
    }
    return (1 - t) * self + t * k

    // Alternative implementation using allowed fused multiply-add function,
    // but which produces incorrect results for (21, 42, 0.3, 27.3) test case
    //return self.addingProduct(t, k - self)
  }
}
