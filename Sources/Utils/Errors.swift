public enum MatrixError: Error {
  case shapesMismatch
  case inconsistentShape
  case emptyRow
  case notSquare
}

public enum VectorError: Error {
  case zeroOrEmpty
  case not3D
}

public enum GenericError: Error {
  case typesMismatch
  case incorrectValue(_ x: Any)
}
