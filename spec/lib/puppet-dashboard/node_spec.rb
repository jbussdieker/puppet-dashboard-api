require 'spec_helper'

module PuppetDashboard
  describe Node do
    describe "all" do
      around(:each) do |example|
        VCR.use_cassette("nodes") do
          example.run
        end
      end

      it "finds 1 node" do
        expect(Node.all.length).to eql(1)
      end
    end

    describe "show" do
      around(:each) do |example|
        VCR.use_cassette("nodes_example.com") do
          example.run
        end
      end

      subject { Node.find("example.com") }

      it "finds the node" do
        expect(subject).not_to be_nil
      end

      it "has parameters" do
       expect(subject.parameters).to be_kind_of Parameter
      end

      it "has specific parameters" do
       expect(subject.parameters["role"]).to eql("example")
      end
    end
  end
end
