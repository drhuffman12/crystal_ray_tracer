require "../src/crystal_ray_tracer.cr"
# include CrystalRayTracer

width, height = 500, 500
image = StumpyCore::Canvas.new(width, height)

t1 = Time.monotonic
rayTracer = CrystalRayTracer::RayTracer.new
scene = CrystalRayTracer::DefaultScene.new
rayTracer.render(scene, image, width, height)
t2 = (Time.monotonic - t1).total_milliseconds

puts "Completed in #{t2} ms"

StumpyPNG.write(image, "crystal-raytracer.png")

# Pseudo-spec (for now; probably should refactor a bit into a spec's):

delta = `echo "'$(git diff --no-index --binary crystal-raytracer.png examples/crystal-raytracer.png)'"`
# delta = `echo "'$(git diff --no-index --binary crystal-raytracer.png crystal-raytracer_altered.png)'"`

if delta == "''\n"
  puts "Yay! Image matches target image! :)"
else
  puts "Oops! Image does NOT match target image! :)"
  puts "git diff saved to 'git_diff.log'"
  File.write("git_diff.log", delta)
end
