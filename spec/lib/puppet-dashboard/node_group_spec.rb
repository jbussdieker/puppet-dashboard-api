require 'spec_helper'

module PuppetDashboard
  describe NodeGroup do
    describe "all" do
      around(:each) do |example|
        VCR.use_cassette("node_groups") do
          example.run
        end
      end

      subject { NodeGroup.all }

      it "finds 3 node groups" do
        expect(subject.length).to eql(3)
      end
    end

    describe "destroy" do
      around(:each) do |example|
        VCR.use_cassette("node_group_destroy") do
          example.run
        end
      end

      it "removes the node group" do
        expect {
          NodeGroup.all.first.destroy
        }.to change { NodeGroup.all.count }.by(-1)
      end
    end

    describe "show" do
      around(:each) do |example|
        VCR.use_cassette("node_group") do
          example.run
        end
      end

      subject { NodeGroup.find("sample_hosts") }

      it "finds the group" do
        expect(subject).not_to be_nil
      end

      it "has specific parameters" do
       expect(subject["sample"]).to eql("true")
      end
    end
  end
end
