require 'spec_helper'

module PuppetDashboard
  describe NodeClass do
    describe "all" do
      around(:each) do |example|
        VCR.use_cassette("node_classes") do
          example.run
        end
      end

      subject { NodeClass.all }

      it "finds 1 node class" do
        expect(subject.length).to eql(1)
      end
    end

    describe "destroy" do
      around(:each) do |example|
        VCR.use_cassette("node_class_destroy") do
          example.run
        end
      end

      it "removes the node class" do
        expect {
          NodeClass.all.first.destroy
        }.to change { NodeClass.all.count }.by(-1)
      end
    end

    describe "show" do
      around(:each) do |example|
        VCR.use_cassette("node_class") do
          example.run
        end
      end

      subject { NodeClass.find("collectd") }

      it "finds the class" do
        expect(subject).not_to be_nil
      end
    end
  end
end
