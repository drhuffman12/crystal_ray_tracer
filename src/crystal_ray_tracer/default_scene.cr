module CrystalRayTracer
  class DefaultScene
    getter :things, :lights, :camera

    def initialize
      @things = [
        Plane.new(Vector.new(0.0, 1.0, 0.0), 0.0, Surface_checkerboard),
        Sphere.new(Vector.new(0.0, 1.0, -0.25), 1.0, Surface_shiny),
        Sphere.new(Vector.new(-1.0, 0.5, 1.5), 0.5, Surface_shiny),
      ]
      @lights = [
        Light.new(Vector.new(-2.0, 2.5, 0.0), Color.new(0.49, 0.07, 0.07)),
        Light.new(Vector.new(1.5, 2.5, 1.5), Color.new(0.07, 0.07, 0.49)),
        Light.new(Vector.new(1.5, 2.5, -1.5), Color.new(0.07, 0.49, 0.071)),
        Light.new(Vector.new(0.0, 3.5, 0.0), Color.new(0.21, 0.21, 0.35)),
      ]
      @camera = Camera.new(Vector.new(3.0, 2.0, 4.0), Vector.new(-1.0, 0.5, 0.0))
    end
  end
end
