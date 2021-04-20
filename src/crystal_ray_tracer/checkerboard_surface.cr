require "./surface.cr"

module CrystalRayTracer
  class CheckerboardSurface < Surface
    def diffuse(pos)
      ((pos.z).floor + (pos.x).floor).to_i.odd? ? Color_white : Color_black
    end

    def reflect(pos)
      ((pos.z).floor + (pos.x).floor).to_i.odd? ? 0.1 : 0.7
    end

    def specular(pos)
      Color_white
    end

    def roughness
      250
    end
  end
end
