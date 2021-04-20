module CrystalRayTracer
  abstract class Surface
  end

  Surface_shiny        = ShinySurface.new
  Surface_checkerboard = CheckerboardSurface.new
end
