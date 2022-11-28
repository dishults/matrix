import Models

var u = Vector([0, 0, 0])
print(u.norm_1(), u.norm(), u.norm_inf())

u = Vector([1, 2, 3])
print(u.norm_1(), u.norm(), u.norm_inf())

u = Vector([-1, -2])
print(u.norm_1(), u.norm(), u.norm_inf())
