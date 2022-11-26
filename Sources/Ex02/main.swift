import Models

import func Functions.lerp

do {
  print(try lerp(21 as K, 42 as K, 0.3))
  print()
  print(try lerp(Vector([2, 1]), Vector([4, 2]), 0.3))
  print()
  print(try lerp(Matrix([[2, 1], [3, 4]]), Matrix([[20, 10], [30, 40]]), 0.5))
} catch {
  print("Error: \(error)")
}
