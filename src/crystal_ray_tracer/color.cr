module CrystalRayTracer
  struct Color
    getter r, g, b

    def initialize(@r : Float64, @g : Float64, @b : Float64)
    end

    def self.scale(k, v)
      Color.new(k * v.r, k * v.g, k * v.b)
    end

    def self.plus(v1, v2)
      Color.new(v1.r + v2.r, v1.g + v2.g, v1.b + v2.b)
    end

    def self.mult(v1, v2)
      Color.new(v1.r * v2.r, v1.g * v2.g, v1.b * v2.b)
    end

    def self.toDrawingColor(c)
      r = (c.r.clamp(0.0, 1.0)*255).floor
      g = (c.g.clamp(0.0, 1.0)*255).floor
      b = (c.b.clamp(0.0, 1.0)*255).floor
      {r, g, b}
    end
  end
end
