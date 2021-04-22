# require "./spec_helper"

# describe CrystalRayTracer do
#   # TODO: Write tests
# end

# # TODO: Spectator seems to not work with Windows; I get:
# ```
# Run crystal spec
# Error: while requiring "./spec/crystal_ray_tracer_spec.cr"
# Error: Process completed with exit code 1.
# ```

require "./spectator_helper"

Spectator.describe CrystalRayTracer do
  # TODO: Write tests

  pending "works" do
    expect(false).to be_true
  end
end
