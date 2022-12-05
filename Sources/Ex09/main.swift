import Models

do {
  print(try Matrix([[1, 2], [3, 4]]).transpose())
} catch {
  print("Matrix error: \(error)")
}
