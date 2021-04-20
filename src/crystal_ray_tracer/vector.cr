module CrystalRayTracer
  struct Vector
    getter x, y, z

    def initialize(@x : Float64, @y : Float64, @z : Float64)
    end

    def self.minus(v1, v2)
      Vector.new(v1.x - v2.x, v1.y - v2.y, v1.z - v2.z)
    end

    def self.plus(v1, v2)
      Vector.new(v1.x + v2.x, v1.y + v2.y, v1.z + v2.z)
    end

    def self.scale(k, v)
      Vector.new(k * v.x, k * v.y, k * v.z)
    end

    def self.dot(v1, v2)
      v1.x * v2.x + v1.y * v2.y + v1.z * v2.z
    end

    def self.mag(v)
      Math.sqrt(Vector.dot(v, v))
    end

    def self.norm(v)
      mag = Vector.mag(v)
      div = (mag == 0) ? Float64::INFINITY : 1.0 / mag
      Vector.scale(div, v)
    end

    def self.cross(v1, v2)
      Vector.new(v1.y * v2.z - v1.z * v2.y, v1.z * v2.x - v1.x * v2.z, v1.x * v2.y - v1.y * v2.x)
    end
  end
end
