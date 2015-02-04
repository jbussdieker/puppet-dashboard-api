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

    describe "destroy" do
      around(:each) do |example|
        VCR.use_cassette("node_destroy") do
          example.run
        end
      end

      it "removes the node" do
        expect {
          Node.all.first.destroy
        }.to change { Node.all.count }.by(-1)
      end
    end

    describe "show" do
      around(:each) do |example|
        VCR.use_cassette("node") do
          example.run
        end
      end

      subject { Node.find("example.com") }

      it "finds the node" do
        expect(subject).not_to be_nil
      end

      it "has specific parameters" do
       expect(subject["role"]).to eql("example")
      end
    end
  end
end
