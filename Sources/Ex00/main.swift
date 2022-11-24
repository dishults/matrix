import Models

var v1 = Vector([2.0, 3.0])
var v2 = Vector([5.0, 7.0])
do {
  try v1.add(&v2)
  print("\(v1)")
} catch {
  print("Vector error: \(error)")
}

print()

var m1 = Matrix([
  [1.0, 2.0],
  [3.0, 4.0],
])
var m2 = Matrix([
  [7.0, 4.0],
  [-2.0, 2.0],
])
do {
  try m1.add(&m2)
  print("\(m1)")
} catch {
  print("Matrix error: \(error)")
}
