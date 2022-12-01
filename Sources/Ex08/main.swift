import Models

do {
  let u = try Matrix([
    [2, -5, 0],
    [4, 3, 7],
    [-2, 3, 4],
  ])
  print(try u.trace())
} catch {
  print("Matrix error: \(error)")
}
