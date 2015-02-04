require 'spec_helper'

module PuppetDashboard
  describe NodeGroup do
    describe "all" do
      around(:each) do |example|
        VCR.use_cassette("node_group") do
          example.run
        end
      end

      subject { NodeGroup.all }

      it "finds 3 node groups" do
        expect(subject.length).to eql(3)
      end
    end

    describe "show" do
      around(:each) do |example|
        VCR.use_cassette("node_group_sample_hosts") do
          example.run
        end
      end

      subject { NodeGroup.find("sample_hosts") }

      it "finds the group" do
        expect(subject).not_to be_nil
      end

      it "has parameters" do
       expect(subject.parameters).to be_kind_of Parameter
      end

      it "has specific parameters" do
       expect(subject.parameters["sample"]).to eql("true")
      end
    end
  end
end
