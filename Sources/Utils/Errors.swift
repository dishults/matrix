public enum MatrixError: Error {
  case shapesMismatch
  case inconsistentShape
  case emptyRow
}

public enum GenericError: Error {
  case typesMismatch
  case incorrectValue(_ x: Any)
}
