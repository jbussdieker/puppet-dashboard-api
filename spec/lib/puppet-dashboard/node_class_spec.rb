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
