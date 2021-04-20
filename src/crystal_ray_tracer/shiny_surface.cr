require "./surface.cr"

module CrystalRayTracer
  class ShinySurface < Surface
    def diffuse(pos)
      Color_white
    end

    def specular(pos)
      Color_grey
    end

    def reflect(pos)
      0.7
    end

    def roughness
      250
    end
  end
end
