import Models

do {
  print(
    try Matrix([
      [1, 0, 0],
      [0, 1, 0],
      [0, 0, 1],
    ]).row_echelon())
  print()
  print(
    try Matrix([
      [1, 2],
      [3, 4],
    ]).row_echelon())
  print()
  print(
    try Matrix([
      [1, 2],
      [2, 4],
    ]).row_echelon())
  print()
  print(
    try Matrix([
      [8, 5, -2, 4, 28],
      [4, 2.5, 20, 4, -4],
      [8, 5, 1, 4, 17],
    ]).row_echelon())
} catch {
  print("Matrix error: \(error)")
}
