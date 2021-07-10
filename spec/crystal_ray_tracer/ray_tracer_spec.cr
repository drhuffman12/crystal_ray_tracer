require "./../spectator_helper"

Spectator.describe CrystalRayTracer::RayTracer do
  context "#initialize" do
    context "with no params passed in" do
      it "does not raise" do
        expect(CrystalRayTracer::RayTracer.new).not_to raise_error
      end
    end
  end

  # TODO: Write tests
end
