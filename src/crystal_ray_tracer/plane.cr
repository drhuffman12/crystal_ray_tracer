require "./thing.cr"

module CrystalRayTracer
  class Plane < Thing
    def initialize(@_norm : Vector, @offset : Float64, @_surface : Surface)
    end

    def normal(pos)
      @_norm
    end

    def surface
      @_surface
    end

    def intersect(ray)
      denom = Vector.dot(@_norm, ray.dir)
      return nil if denom > 0
      dist = (Vector.dot(@_norm, ray.start) + @offset) / (-denom)
      Intersection.new(self, ray, dist)
    end
  end
end
