import Models

do {
  let u = try Matrix([[2, 0], [0, 2]])
  let v = Vector([4, 2])
  print(try u.mul_vec(v))
} catch {
  print("Matrix error: \(error)")
}
print()
do {
  let u = try Matrix([[3, -5], [6, 8]])
  let v = try Matrix([[2, 1], [4, 2]])
  print(try u.mul_mat(v))
} catch {
  print("Matrix error: \(error)")
}
