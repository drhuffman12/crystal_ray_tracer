require "./../spec_helper"

describe CrystalRayTracer::DefaultScene do
  context "#initialize" do
    context "with no params passed in" do
      it "does not raise" do
        (CrystalRayTracer::DefaultScene.new).should_not be_nil # should_not raise_error
      end
    end
  end

  # TODO: Write tests
end
