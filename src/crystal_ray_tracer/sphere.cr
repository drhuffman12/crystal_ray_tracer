require "./thing.cr"

module CrystalRayTracer
  class Sphere < Thing
    @radius2 : Float64

    def initialize(@center : Vector, radius : Float64, @_surface : Surface)
      @radius2 = radius*radius
    end

    def normal(pos)
      Vector.norm(Vector.minus(pos, @center))
    end

    def surface
      @_surface
    end

    def intersect(ray)
      eo = Vector.minus(@center, ray.start)
      v = Vector.dot(eo, ray.dir)
      dist = 0.0
      if (v >= 0)
        disc = @radius2 - (Vector.dot(eo, eo) - v * v)
        dist = v - Math.sqrt(disc) if (disc >= 0)
      end
      (dist == 0) ? nil : Intersection.new(self, ray, dist)
    end
  end
end
