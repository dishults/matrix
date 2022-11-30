import Models

import func Functions.angle_cos

var u = Vector([1, 2, 3])
var v = Vector([4, 5, 6])
do {
  print(try angle_cos(&u, &v))
} catch {
  print("Vector error: \(error)")
}
