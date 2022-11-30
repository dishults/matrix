public enum MatrixError: Error {
  case shapesMismatch
  case inconsistentShape
  case emptyRow
  case zeroVector
}

public enum GenericError: Error {
  case typesMismatch
  case incorrectValue(_ x: Any)
}
