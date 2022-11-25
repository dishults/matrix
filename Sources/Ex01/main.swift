import Models

import func Functions.linear_combination

let v1 = Vector([1, 2, 3])
let v2 = Vector([0, 10, -100])
var u = [v1, v2]
var coefs: [K] = [10, -2]
do {
  print(try linear_combination(&u, &coefs))
} catch {
  print("Vector error: \(error)")
}
