require "../src/crystal_ray_tracer.cr"
# include CrystalRayTracer

width, height = 5000, 5000
image = StumpyCore::Canvas.new(width, height)

t1 = Time.monotonic
rayTracer = CrystalRayTracer::RayTracer.new
scene = CrystalRayTracer::DefaultScene.new
rayTracer.render(scene, image, width, height)
t_calc_image = (Time.monotonic - t1).total_milliseconds

puts "Completed in #{t_calc_image} ms"

to_file = "crystal-raytracer_serial_huge.png"
StumpyPNG.write(image, to_file)

t_total = (Time.monotonic - t1).total_milliseconds
t_write_file = t_total - t_calc_image
puts "File written in #{t_write_file} ms to #{to_file}"
puts "Completed in #{t_total} ms"

# Pseudo-spec (for now; probably should refactor a bit into a spec's):

# delta = `echo "'$(git diff --no-index --binary crystal-raytracer.png examples/crystal-raytracer.png)'"`
delta = `echo "'$(git diff --no-index --binary #{to_file} examples/image/crystal-raytracer_example_huge.png)'"`

if delta == "''\n"
  puts "Yay! Image matches target image! :)"
else
  puts "Oops! Image does NOT match target image! :)"
  puts "git diff saved to 'git_diff.log'"
  File.write("git_diff.log", delta)
end
