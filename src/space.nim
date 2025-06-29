import math

type
  Vec*[N, T] = array[N, T]
  Vec2*[T] = Vec[2, T]
  Vec3*[T] = Vec[3, T]
  Vec4*[T] = Vec[4, T]
  Vec2f* = Vec2[float]
  Vec3f* = Vec3[float]
  Vec4f* = Vec4[float]

func x*[N, T](v: Vec[N, T]) = T: v[0]
# func `x=`*[N, T](v: var Vec[N, T]; val: T) = v[0] = val

func y*[N, T](v: Vec[N, T]) = T: v[1]
# func `y=`*[N, T](v: var Vec[N, T]; val: T) = v[1] = val

func z*[N, T](v: Vec[N, T]) = T: v[2]
# func `z=`*[N, T](v: var Vec[N, T]; val: T) = v[2] = val

func w*[N, T](v: Vec[N, T]) = T: v[3]
# func `w=`*[N, T](v: var Vec[N, T]; val: T) = v[3] = val

func `+`*[N, T](v1, v2: Vec[N, T]): Vec[N, T] =
  for i in 0..N.high:
    result[i] = v1[i] + v2[i]

func `-`*[N, T](v1, v2: Vec[N, T]): Vec[N, T] =
  for i in 0..N.high:
    result[i] = v1[i] - v2[i]

func `*`*[N, T](v: Vec[N, T]; val: T): Vec[N, T] =
  for i in 0..N.high:
    result[i] = v[i] * val

func `/`*[N, T](v: Vec[N, T]; val: T): Vec[N, T] =
  for i in 0..N.high:
    result[i] = v[i] / val

func len2*[N, T](v: Vec[N, T]): T =
  for i in 0..N.high: result += pow(v[i], 2)

func len*[N, T](v: Vec[N, T]): T =
  sqrt(v.len2)
