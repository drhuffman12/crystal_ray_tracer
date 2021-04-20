require "./../spec_helper"

describe CrystalRayTracer::RayTracer do
  context "#initialize" do
    context "with no params passed in" do
      it "does not raise" do
        (CrystalRayTracer::RayTracer.new).should_not be_nil # should_not raise_error
      end
    end
  end

  # TODO: Write tests
end
