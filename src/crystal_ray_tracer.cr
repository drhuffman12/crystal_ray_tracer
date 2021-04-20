require "stumpy_png"
require "./crystal_ray_tracer/*"

module CrystalRayTracer
  VERSION = {{ `shards version "#{__DIR__}"`.chomp.stringify }}

  Color_white        = Color.new(1.0, 1.0, 1.0)
  Color_grey         = Color.new(0.5, 0.5, 0.5)
  Color_black        = Color.new(0.0, 0.0, 0.0)
  Color_background   = Color_black
  Color_defaultColor = Color_black

  record Ray, start : Vector, dir : Vector
  record Light, pos : Vector, color : Color
  record Intersection, thing : Thing, ray : Ray, dist : Float64
end
