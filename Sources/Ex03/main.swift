import Models

do {
  print(try Vector([-1, 6]).dot(Vector([3, 2])))
} catch {
  print("Vector error: \(error)")
}
