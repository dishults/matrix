import Models

import func Functions.cross_product

var u = Vector([1, 2, 3])
var v = Vector([4, 5, 6])
do {
  print(try cross_product(&u, &v))
} catch {
  print("Vector error: \(error)")
}
