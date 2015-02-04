module PuppetDashboard
  class Node < Base
    self.primary_key = :name

    has_many :parameters, :class_name => PuppetDashboard::Parameter

    def parameters
      super.tap do |params|
        params.owner = self
      end
    end
  end
end
