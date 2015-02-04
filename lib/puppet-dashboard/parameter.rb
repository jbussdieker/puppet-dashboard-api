module PuppetDashboard
  class Parameter < Base
    attr_accessor :owner

    def []=(key, value)
      p attributes
      p key, value

      #node.put(nil, nil, {"node" => { "parameter_attributes" => [{"key" => "asdf", "value" => "wow"}] } }.to_json)
    end
  end
end
