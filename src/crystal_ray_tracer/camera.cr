module CrystalRayTracer
  class Camera
    getter pos, forward, right, up

    def initialize(pos : Vector, lookAt)
      @pos = pos
      down = Vector.new(0.0, -1.0, 0.0)
      @forward = Vector.norm(Vector.minus(lookAt, @pos))
      @right = Vector.scale(1.5, Vector.norm(Vector.cross(@forward, down)))
      @up = Vector.scale(1.5, Vector.norm(Vector.cross(@forward, @right)))
    end
  end
end
