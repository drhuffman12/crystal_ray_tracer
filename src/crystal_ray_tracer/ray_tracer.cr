module CrystalRayTracer
  class RayTracer
    MaxDepth = 5

    def intersections(ray, scene)
      closest = Float64::INFINITY
      closestInter = nil
      scene.things.each do |item|
        inter = item.intersect(ray)
        if inter && inter.dist < closest
          closestInter = inter
          closest = inter.dist
        end
      end
      closestInter
    end

    def testRay(ray, scene)
      isect = self.intersections(ray, scene)
      isect && isect.dist
    end

    def traceRay(ray, scene, depth)
      isect = self.intersections(ray, scene)
      isect.nil? ? Color_background : self.shade(isect, scene, depth)
    end

    def shade(isect : Intersection, scene, depth)
      d = isect.ray.dir
      pos = Vector.plus(Vector.scale(isect.dist, d), isect.ray.start)
      normal = isect.thing.normal(pos)
      reflectDir = Vector.minus(d, Vector.scale(2, Vector.scale(Vector.dot(normal, d), normal)))
      naturalColor = Color.plus(Color_background, self.getNaturalColor(isect.thing, pos, normal, reflectDir, scene))
      reflectedColor = (depth >= MaxDepth) ? Color_grey : self.getReflectionColor(isect.thing, pos, normal, reflectDir, scene, depth)
      Color.plus(naturalColor, reflectedColor)
    end

    def getReflectionColor(thing, pos, normal, rd, scene, depth)
      Color.scale(thing.surface.reflect(pos), self.traceRay(Ray.new(pos, rd), scene, depth + 1))
    end

    def getNaturalColor(thing, pos, norm, rd, scene)
      color = Color_defaultColor
      scene.lights.each { |light| color = self.addLight(color, light, pos, norm, scene, thing, rd) }
      color
    end

    def addLight(col, light, pos, norm, scene, thing, rd)
      ldis = Vector.minus(light.pos, pos)
      livec = Vector.norm(ldis)
      neatIsect = self.testRay(Ray.new(pos, livec), scene)

      isInShadow = neatIsect && neatIsect <= Vector.mag(ldis)
      return col if isInShadow

      illum = Vector.dot(livec, norm)
      lcolor = (illum > 0) ? Color.scale(illum, light.color) : Color_defaultColor

      specular = Vector.dot(livec, Vector.norm(rd))
      scolor = (specular > 0) ? Color.scale(specular ** thing.surface.roughness, light.color) : Color_defaultColor

      Color.plus(col, Color.plus(Color.mult(thing.surface.diffuse(pos), lcolor), Color.mult(thing.surface.specular(pos), scolor)))
    end

    def getPoint(x : Int32, y : Int32, screenWidth : Int32, screenHeight : Int32, camera)
      recenterX = (x - (screenWidth >> 1)) / (screenWidth << 1)
      recenterY = -(y - (screenHeight >> 1)) / (screenHeight << 1)
      Vector.norm(Vector.plus(camera.forward, Vector.plus(Vector.scale(recenterX, camera.right), Vector.scale(recenterY, camera.up))))
    end

    def render(scene, image, screenWidth, screenHeight)
      screenHeight.times do |y|
        screenWidth.times do |x|
          color = self.traceRay(Ray.new(scene.camera.pos, self.getPoint(x, y, screenWidth, screenHeight, scene.camera)), scene, 0)
          r, g, b = Color.toDrawingColor(color)
          image.set(x, y, StumpyCore::RGBA.from_rgb(r, g, b))
        end
      end
    end

    def render_parallel(scene, image, screenWidth, screenHeight)
      channel = Channel(Tuple(Int32, Int32, Color)).new

      screenHeight.times do |y|
        spawn do
          screenWidth.times do |x|
            # spawn do
              color = self.traceRay(Ray.new(scene.camera.pos, self.getPoint(x, y, screenWidth, screenHeight, scene.camera)), scene, 0)
              channel.send({x, y, color})
            # end
            # r, g, b = Color.toDrawingColor(color)
            # image.set(x, y, StumpyCore::RGBA.from_rgb(r, g, b))
          end
        end
      end

      (screenHeight * screenWidth).times do
        x, y, color = channel.receive
        r, g, b = Color.toDrawingColor(color)
        image.set(x, y, StumpyCore::RGBA.from_rgb(r, g, b))
      end
    end
  end
end
