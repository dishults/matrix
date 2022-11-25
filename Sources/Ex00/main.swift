import Models

var v1 = Vector([2, 3])
var v2 = Vector([5, 7])
do {
  try v1.add(&v2)
  print("\(v1)")
} catch {
  print("Vector error: \(error)")
}

print()

do {
  var m1 = try Matrix([
    [1, 2],
    [3, 4],
  ])
  var m2 = try Matrix([
    [7, 4],
    [-2, 2],
  ])
  try m1.add(&m2)
  print("\(m1)")
} catch {
  print("Matrix error: \(error)")
}
